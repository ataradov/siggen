/*
 * Copyright (c) 2017, Alex Taradov <alex@taradov.com>
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

/*- Includes ----------------------------------------------------------------*/
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include "samd11.h"
#include "hal_gpio.h"
#include "ssd1306.h"
#include "globals.h"
#include "buttons.h"
#include "config.h"

/*- Definitions -------------------------------------------------------------*/
HAL_GPIO_PIN(FOUT,     A, 14)

#define XTAL_FREQ      12000000000
#define PLL_MIN_FREQ   48000000000

#define FREQ_MIN       100
#define FREQ_MAX       105000000000

#define DC_MIN         0
#define DC_MAX         10000

enum
{
  INPUT_FREQ,
  INPUT_ON_OFF,
  INPUT_DC,
  INPUT_SIZE,
};

/*- Prototypes --------------------------------------------------------------*/
static void update_output(void);
static void update_display(void);

/*- Variables ---------------------------------------------------------------*/
static const int input_size[INPUT_SIZE] = { 12, 1, 5 };
static int generator_input = 0;
static int generator_cursor = 0;

/*- Implementations ---------------------------------------------------------*/

//-----------------------------------------------------------------------------
void generator_init(void)
{
  HAL_GPIO_FOUT_out(); // Enables high drive strength
  HAL_GPIO_FOUT_clr();
}

//-----------------------------------------------------------------------------
void generator_enable(void)
{
  GCLK->GENDIV.reg = GCLK_GENDIV_ID(4) | GCLK_GENDIV_DIV(0);

  GCLK->GENCTRL.reg = GCLK_GENCTRL_ID(4) | GCLK_GENCTRL_SRC_FDPLL |
      GCLK_GENCTRL_RUNSTDBY | GCLK_GENCTRL_GENEN | GCLK_GENCTRL_OE |
      GCLK_GENCTRL_IDC;
  while (GCLK->STATUS.reg & GCLK_STATUS_SYNCBUSY);

  PM->APBCMASK.reg |= PM_APBCMASK_TCC0;

  GCLK->CLKCTRL.reg = GCLK_CLKCTRL_ID_TCC0 | GCLK_CLKCTRL_CLKEN |
      GCLK_CLKCTRL_GEN(4);

  oled_set_font(SMALL);
  oled_putc(0, 0, 'F');
  update_display();
  update_output();
}

//-----------------------------------------------------------------------------
void generator_disable(void)
{
  GCLK->CLKCTRL.reg = GCLK_CLKCTRL_ID_TCC0 | GCLK_CLKCTRL_CLKEN |
      GCLK_CLKCTRL_GEN(0);

  TCC0->CTRLA.reg = TCC_CTRLA_SWRST;
  while (TCC0->SYNCBUSY.bit.SWRST);

  GCLK->GENCTRL.reg = GCLK_GENCTRL_ID(4);
  while (GCLK->STATUS.reg & GCLK_STATUS_SYNCBUSY);

  SYSCTRL->DPLLCTRLA.reg = 0;

  HAL_GPIO_FOUT_pmuxdis();
  HAL_GPIO_FOUT_clr();
}

//-----------------------------------------------------------------------------
static void pll_set(int div, int ldr, int ldrfrac)
{
  SYSCTRL->DPLLCTRLA.reg = 0;
  SYSCTRL->DPLLCTRLB.reg = SYSCTRL_DPLLCTRLB_REFCLK_REF1 | SYSCTRL_DPLLCTRLB_LBYPASS |
      SYSCTRL_DPLLCTRLB_DIV(div / 2 - 1);
  SYSCTRL->DPLLRATIO.reg = SYSCTRL_DPLLRATIO_LDR(ldr - 1) | SYSCTRL_DPLLRATIO_LDRFRAC(ldrfrac);
  SYSCTRL->DPLLCTRLA.reg = SYSCTRL_DPLLCTRLA_ENABLE | SYSCTRL_DPLLCTRLA_RUNSTDBY;
  while (0 == (SYSCTRL->DPLLSTATUS.reg & SYSCTRL_DPLLSTATUS_CLKRDY));
  while (0 == (SYSCTRL->DPLLSTATUS.reg & SYSCTRL_DPLLSTATUS_LOCK));

  SYSCTRL->INTFLAG.reg = SYSCTRL_INTFLAG_DPLLLCKF;
}

//-----------------------------------------------------------------------------
static void pwm_timer_set(int div, int per, int cc)
{ 
  TCC0->CTRLA.reg = TCC_CTRLA_SWRST;
  while (TCC0->SYNCBUSY.bit.SWRST);

  TCC0->CTRLA.reg = TCC_CTRLA_PRESCALER(div) | TCC_CTRLA_PRESCSYNC_PRESC;
  TCC0->WAVE.reg = TCC_WAVE_WAVEGEN_NPWM;

  TCC0->COUNT.reg = 0;
  TCC0->PER.reg = per;
  TCC0->CC[0].reg = cc;

  TCC0->CTRLA.reg |= TCC_CTRLA_ENABLE;
}

//-----------------------------------------------------------------------------
static void update_output(void)
{
  int64_t pll_int, pll_frac, set_freq;
  int64_t pll_freq = g_config.freq;
  int64_t div = 1;
  int pll_div;
  int64_t min_rem;
  int64_t min_step = 0;
  int64_t min_ref = 0;
  bool min_high = false;
  int min_rdiv = 0;
  int set_dc;

  HAL_GPIO_FOUT_pmuxdis();

  oled_set_font(SMALL);

  if (!g_config.on)
  {
    print_freq(3, 0, -1, 0);
    print_dc(3, 92, -1, 0);
    return;
  }

  while (pll_freq < PLL_MIN_FREQ)
  {
    pll_freq *= 2;
    div *= 2;
  }

  min_rem = pll_freq;

  for (int rdiv = 8; rdiv < 376; rdiv += 2) // Ensures 32 kHz - 1 MHz PLL input frequency range
  {
    int64_t ref = (XTAL_FREQ + g_config.xtal_trim) / rdiv;
    int64_t step = ref / 16;
    int64_t rem = pll_freq % step;

    if (rem < min_rem)
    {
      min_rem = rem;
      min_rdiv = rdiv;
      min_step = step;
      min_ref = ref;
      min_high = false;
    }

    if ((step - rem) < min_rem)
    {
      min_rem = step - rem;
      min_rdiv = rdiv;
      min_step = step;
      min_ref = ref;
      min_high = true;
    }

    if (0 == rem)
      break;
  }

  pll_div = pll_freq  / min_step;

  if (min_high)
    pll_div += 1;

  pll_int = pll_div / 16;
  pll_frac = pll_div % 16;
  set_freq = (min_ref * pll_int + min_ref * pll_frac / 16) / div;

  pll_set(min_rdiv, pll_int, pll_frac);

  if (div <= 2)
  {
    GCLK->GENDIV.reg = GCLK_GENDIV_ID(4) | GCLK_GENDIV_DIV(div);
    HAL_GPIO_FOUT_pmuxen(PORT_PMUX_PMUXE_H_Val);

    if (g_config.dc < 3333)
      set_dc = 0;
    else if (g_config.dc > 6666)
      set_dc = 10000;
    else
      set_dc = 5000;
  }
  else
  {
    int timer_div = div;
    int timer_presc = 0;
    int64_t cc;

    GCLK->GENDIV.reg = GCLK_GENDIV_ID(4) | GCLK_GENDIV_DIV(0);

    while (timer_div > (1 << 24))
    {
      timer_div /= 2;
      timer_presc++;
    }

    cc = ((int64_t)g_config.dc * timer_div + 5000) / 10000;
    set_dc = (cc * 10000 + timer_div / 2) / timer_div;

    pwm_timer_set(timer_presc, timer_div - 1, cc);
    HAL_GPIO_FOUT_pmuxen(PORT_PMUX_PMUXE_F_Val);
  }

  if (0 == set_dc)
  {
    HAL_GPIO_FOUT_clr();
    HAL_GPIO_FOUT_pmuxdis();
  }
  else if (10000 == set_dc)
  {
    HAL_GPIO_FOUT_set();
    HAL_GPIO_FOUT_pmuxdis();
  }

  print_freq(3, 0, -1, set_freq);
  print_dc(3, 92, -1, set_dc);
}

//-----------------------------------------------------------------------------
static void update_display(void)
{
  oled_set_font(BIG);
  print_freq(0, 16, (INPUT_FREQ == generator_input) ? generator_cursor : -1, g_config.freq);

  oled_set_font(SMALL);
  print_dc(2, 92, (INPUT_DC == generator_input) ? generator_cursor : -1, g_config.dc);

  oled_set_inverted(INPUT_ON_OFF == generator_input);
  oled_print(2, 0, "    ");

  if (g_config.on)
    oled_print(2, 6, "ON");
  else
    oled_print(2, 4, "OFF");

  oled_set_inverted(false);
}

//-----------------------------------------------------------------------------
void generator_buttons_event(int button, int event, int interval)
{
  if (BUTTON_PRESSED == event && BUTTON_CENTER == button)
    return set_menu_mode();

  if (BUTTON_PRESSED == event || BUTTON_REPEAT == event)
  {
    if (BUTTON_RIGHT == button)
    {
      generator_cursor--;

      if (generator_cursor < 0)
      {
        generator_input++;

        if (generator_input == INPUT_SIZE)
          generator_input = 0;

        generator_cursor = input_size[generator_input] - 1;
      }
    }
    else if (BUTTON_LEFT == button)
    {
      generator_cursor++;

      if (generator_cursor == input_size[generator_input])
      {
        generator_input--;

        if (generator_input < 0)
          generator_input = INPUT_SIZE - 1;

        generator_cursor = 0;
      }
    }

    if (INPUT_FREQ == generator_input)
    {
      int64_t step = ipow(10, generator_cursor);

      if (BUTTON_UP == button)
      {
        if (g_config.freq <= (FREQ_MAX - step))
          g_config.freq += step;

        update_output();
      }
      else if (BUTTON_DOWN == button)
      {
        if (g_config.freq >= (FREQ_MIN + step))
          g_config.freq -= step;

        update_output();
      }
    }
    else if (INPUT_ON_OFF == generator_input)
    {
      if (BUTTON_UP == button || BUTTON_DOWN == button)
      {
        g_config.on = !g_config.on;
        update_output();
      }
    }
    else if (INPUT_DC == generator_input)
    {
      int step = ipow(10, generator_cursor);

      if (BUTTON_UP == button)
      {
        if (g_config.dc <= (DC_MAX - step))
          g_config.dc += step;

        update_output();
      }
      else if (BUTTON_DOWN == button)
      {
        if (g_config.dc >= (DC_MIN + step))
          g_config.dc -= step;

        update_output();
      }
    }
  }

  update_display();

  (void)interval;
}

//-----------------------------------------------------------------------------
void generator_task(void)
{
  update_pll_lock_indicator();
}


