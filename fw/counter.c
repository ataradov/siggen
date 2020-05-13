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
#include "hal_gpio.h"
#include "config.h"
#include "ssd1306.h"
#include "globals.h"
#include "buttons.h"

/*- Definitions -------------------------------------------------------------*/
HAL_GPIO_PIN(FIN, A, 15)

#define XTAL_FREQ           12000000000
#define XTAL_TRIM_MAX       99999999
#define XTAL_TRIM_MIN       -99999999

#define SWITCH_BLOCK_TIME   3 // gate times

/*- Prototypes --------------------------------------------------------------*/
static void update_switch_freq(void);
static void update_pll_trim(void);
static void setup_clocks(void);
static void setup_event_system(void);
static void setup_gate_timer(void);
static void setup_eic(void);
static void setup_tcc(void);
static void update_display(void);

/*- Variables ---------------------------------------------------------------*/
static bool counter_gated_mode = true;
static int counter_gate_ind_off_time = 0;
static volatile int counter_ovf_cnt = 0;
static int64_t counter_freq;
static int64_t counter_gate_mult;
static int64_t counter_switch_freq_hi;
static int64_t counter_switch_freq_lo;
static int counter_switch_block = 0;
static int64_t counter_acc_a = 0;
static int64_t counter_acc_b = 0;
static int counter_acc_cnt = 0;
static int64_t counter_pll_freq;
static bool counter_trim_mode = false;
static int counter_cursor = 0;

/*- Implementations ---------------------------------------------------------*/

//-----------------------------------------------------------------------------
void counter_init(void)
{
  HAL_GPIO_FIN_in();
}

//-----------------------------------------------------------------------------
void counter_enable(void)
{
  oled_set_font(SMALL);
  oled_putc(0, 0, 'C');

  counter_freq = 0;
  counter_switch_block = 0;
  counter_acc_b = 0;
  counter_acc_a = 0;
  counter_acc_cnt = 0;

  setup_clocks();
  setup_event_system();
  setup_gate_timer();
  setup_eic();
  setup_tcc();
  update_switch_freq();
  update_display();
}

//-----------------------------------------------------------------------------
void counter_disable(void)
{
  GCLK->CLKCTRL.reg = GCLK_CLKCTRL_ID_TCC0 | GCLK_CLKCTRL_CLKEN |
      GCLK_CLKCTRL_GEN(0);

  GCLK->CLKCTRL.reg = GCLK_CLKCTRL_ID_TC1_TC2 | GCLK_CLKCTRL_CLKEN |
      GCLK_CLKCTRL_GEN(0);

  GCLK->CLKCTRL.reg = GCLK_CLKCTRL_ID_EIC | GCLK_CLKCTRL_CLKEN |
      GCLK_CLKCTRL_GEN(0);

  GCLK->CLKCTRL.reg = GCLK_CLKCTRL_ID_EVSYS_0 | GCLK_CLKCTRL_CLKEN |
      GCLK_CLKCTRL_GEN(0);
  GCLK->CLKCTRL.reg = GCLK_CLKCTRL_ID_EVSYS_1 | GCLK_CLKCTRL_CLKEN |
      GCLK_CLKCTRL_GEN(0);

  TCC0->CTRLA.reg = TCC_CTRLA_SWRST;
  while (TCC0->SYNCBUSY.bit.SWRST);

  TC1->COUNT32.CTRLA.reg |= TC_CTRLA_SWRST;
  while (TC1->COUNT32.STATUS.bit.SYNCBUSY);
  while (TC1->COUNT32.CTRLA.bit.SWRST);

  GCLK->GENCTRL.reg = GCLK_GENCTRL_ID(4);
  while (GCLK->STATUS.reg & GCLK_STATUS_SYNCBUSY);

  SYSCTRL->DPLLCTRLA.reg = 0;

  HAL_GPIO_FIN_pmuxdis();
}

//-----------------------------------------------------------------------------
static void update_switch_freq(void)
{
  if (CONFIG_DF_ALWAYS_GATED == g_config.direct_freq)
  {
    counter_switch_freq_hi = 0;
    counter_switch_freq_lo = -1;
  }
  else if (CONFIG_DF_1_kHz == g_config.direct_freq)
  {
    counter_switch_freq_lo =  950000;
    counter_switch_freq_hi = 1050000;
  }
  else if (CONFIG_DF_10_kHz == g_config.direct_freq)
  {
    counter_switch_freq_lo =  9900000;
    counter_switch_freq_hi = 10100000;
  }
  else if (CONFIG_DF_100_kHz == g_config.direct_freq)
  {
    counter_switch_freq_lo =  99000000;
    counter_switch_freq_hi = 101000000;
  }
  else // CONFIG_DF_1_MHz
  {
    counter_switch_freq_lo =  990000000;
    counter_switch_freq_hi = 1010000000;
  }
}

//-----------------------------------------------------------------------------
static void update_pll_trim(void)
{
  int64_t cc;

  counter_pll_freq = ((XTAL_FREQ + g_config.xtal_trim) * 100) / 12;

  cc = counter_pll_freq / 1000;

  TC1->COUNT32.CTRLA.bit.ENABLE = 0;

  if (CONFIG_GT_0_1S == g_config.gate_time)
  {
    cc /= 10;
    counter_gate_mult = 10000;
  }
  else if (CONFIG_GT_1S == g_config.gate_time)
  {
    counter_gate_mult = 1000;
  }
  else if (CONFIG_GT_5S == g_config.gate_time)
  {
    cc *= 5;
    counter_gate_mult = 200;
  }
  else // CONFIG_GT_10S
  {
    cc *= 10;
    counter_gate_mult = 100;
  }

  cc /= 2;

  TC1->COUNT32.COUNT.reg = 0;
  TC1->COUNT32.CC[0].reg = cc;
  TC1->COUNT32.CTRLA.bit.ENABLE = 1;
}

//-----------------------------------------------------------------------------
static void setup_clocks(void)
{
  GCLK->GENCTRL.reg = GCLK_GENCTRL_ID(4) | GCLK_GENCTRL_SRC_FDPLL |
      GCLK_GENCTRL_RUNSTDBY | GCLK_GENCTRL_GENEN | GCLK_GENCTRL_IDC;
  while (GCLK->STATUS.reg & GCLK_STATUS_SYNCBUSY);

  SYSCTRL->DPLLCTRLB.reg = SYSCTRL_DPLLCTRLB_REFCLK_REF1 | SYSCTRL_DPLLCTRLB_LBYPASS |
      SYSCTRL_DPLLCTRLB_DIV(12 / 2 - 1); // 1 MHz reference
  SYSCTRL->DPLLRATIO.reg = SYSCTRL_DPLLRATIO_LDR(100 - 1) | SYSCTRL_DPLLRATIO_LDRFRAC(0);
  SYSCTRL->DPLLCTRLA.reg = SYSCTRL_DPLLCTRLA_ENABLE | SYSCTRL_DPLLCTRLA_RUNSTDBY;
  while (0 == (SYSCTRL->DPLLSTATUS.reg & SYSCTRL_DPLLSTATUS_CLKRDY));
  while (0 == (SYSCTRL->DPLLSTATUS.reg & SYSCTRL_DPLLSTATUS_LOCK));

  SYSCTRL->INTFLAG.reg = SYSCTRL_INTFLAG_DPLLLCKF;
}

//-----------------------------------------------------------------------------
static void setup_event_system(void)
{
  PM->APBCMASK.reg |= PM_APBCMASK_EVSYS;

  GCLK->CLKCTRL.reg = GCLK_CLKCTRL_ID_EVSYS_0 | GCLK_CLKCTRL_CLKEN |
      GCLK_CLKCTRL_GEN(4);
  GCLK->CLKCTRL.reg = GCLK_CLKCTRL_ID_EVSYS_1 | GCLK_CLKCTRL_CLKEN |
      GCLK_CLKCTRL_GEN(4);

  EVSYS->CTRL.reg = EVSYS_CTRL_GCLKREQ;

  if (counter_gated_mode)
  {
    EVSYS->USER.reg = EVSYS_USER_USER(0x04/*TCC0_EV0*/) | EVSYS_USER_CHANNEL(0+1);
    EVSYS->CHANNEL.reg = EVSYS_CHANNEL_CHANNEL(0) | EVSYS_CHANNEL_PATH_ASYNCHRONOUS |
        EVSYS_CHANNEL_EDGSEL_RISING_EDGE | EVSYS_CHANNEL_EVGEN(0x0d/*EIC_EXTINT1*/);

    EVSYS->USER.reg = EVSYS_USER_USER(0x05/*TCC0_EV1*/) | EVSYS_USER_CHANNEL(1+1);
    EVSYS->CHANNEL.reg = EVSYS_CHANNEL_CHANNEL(1) | EVSYS_CHANNEL_PATH_ASYNCHRONOUS |
        EVSYS_CHANNEL_EDGSEL_RISING_EDGE | EVSYS_CHANNEL_EVGEN(0x21/*TC1 MC1*/);
  }
  else
  {
    EVSYS->USER.reg = EVSYS_USER_USER(0x05/*TCC0_EV1*/) | EVSYS_USER_CHANNEL(1+1);
    EVSYS->CHANNEL.reg = EVSYS_CHANNEL_CHANNEL(1) | EVSYS_CHANNEL_PATH_ASYNCHRONOUS |
        EVSYS_CHANNEL_EDGSEL_RISING_EDGE | EVSYS_CHANNEL_EVGEN(0x0d/*EIC_EXTINT1*/);
  }
}

//-----------------------------------------------------------------------------
static void setup_gate_timer(void)
{
  PM->APBCMASK.reg |= PM_APBCMASK_TC1 | PM_APBCMASK_TC2;

  GCLK->CLKCTRL.reg = GCLK_CLKCTRL_ID_TC1_TC2 | GCLK_CLKCTRL_CLKEN |
      GCLK_CLKCTRL_GEN(4);

  TC1->COUNT32.CTRLA.reg = TC_CTRLA_MODE_COUNT32 | TC_CTRLA_WAVEGEN_MFRQ |
      TC_CTRLA_PRESCALER_DIV2 | TC_CTRLA_PRESCSYNC_GCLK;

  TC1->COUNT32.COUNT.reg = 0;
  TC1->COUNT32.EVCTRL.reg = TC_EVCTRL_MCEO1;

  update_pll_trim();
}

//-----------------------------------------------------------------------------
static void setup_eic(void)
{
  PM->APBAMASK.reg |= PM_APBAMASK_EIC;

  HAL_GPIO_FIN_pmuxen(PORT_PMUX_PMUXE_A_Val);

  GCLK->CLKCTRL.reg = GCLK_CLKCTRL_ID_EIC | GCLK_CLKCTRL_CLKEN |
      GCLK_CLKCTRL_GEN(4);

  if (counter_gated_mode)
  {
    EIC->CONFIG[0].reg = EIC_CONFIG_SENSE1_FALL;
  }
  else
  {
    EIC->CONFIG[0].reg = EIC_CONFIG_SENSE1_HIGH;
  }

  EIC->EVCTRL.reg = EIC_EVCTRL_EXTINTEO1;
  EIC->CTRL.bit.ENABLE = 1;
}

//-----------------------------------------------------------------------------
static void setup_tcc(void)
{
  PM->APBCMASK.reg |= PM_APBCMASK_TCC0;

  GCLK->CLKCTRL.reg = GCLK_CLKCTRL_ID_TCC0 | GCLK_CLKCTRL_CLKEN |
      GCLK_CLKCTRL_GEN(4);

  TCC0->CTRLA.reg = TCC_CTRLA_PRESCALER_DIV1 | TCC_CTRLA_PRESCSYNC_GCLK |
      TCC_CTRLA_CPTEN0 | TCC_CTRLA_CPTEN1;

  if (counter_gated_mode)
  {
    TCC0->EVCTRL.reg = TCC_EVCTRL_EVACT0_COUNT | TCC_EVCTRL_TCEI0 |
        TCC_EVCTRL_EVACT1_PPW | TCC_EVCTRL_TCEI1;
  }
  else
  {
    TCC0->EVCTRL.reg = TCC_EVCTRL_EVACT1_PPW | TCC_EVCTRL_TCEI1;
  }

  TCC0->WAVE.reg = TCC_WAVE_WAVEGEN_NFRQ;
  TCC0->COUNT.reg = 0;
  TCC0->PER.reg = 0xffffff;
  TCC0->CTRLA.reg |= TCC_CTRLA_ENABLE;

  counter_ovf_cnt = 0;

  TCC0->INTENSET.reg = TCC_INTFLAG_OVF;
  NVIC_EnableIRQ(TCC0_IRQn);
}

//-----------------------------------------------------------------------------
void irq_handler_tcc0(void)
{
  TCC0->INTFLAG.reg = TCC_INTFLAG_OVF;
  counter_ovf_cnt++;
}

//-----------------------------------------------------------------------------
static void update_display(void)
{
  oled_set_font(BIG);
  print_freq(0, 16, -1, counter_freq);

  if (counter_trim_mode)
  {
    oled_set_font(SMALL);
    oled_print(3, 0, "TRIM:");
    print_freq_sign(3, 36, counter_cursor, g_config.xtal_trim);
  }
}

//-----------------------------------------------------------------------------
void counter_buttons_event(int button, int event, int interval)
{
  static int hold_time = 0;
  bool both_pressed = false;

  if (BUTTON_PRESSED == event && BUTTON_CENTER == button)
    return set_menu_mode();

  both_pressed = buttons_pressed(BUTTON_RIGHT) && buttons_pressed(BUTTON_LEFT);

  if (BUTTON_REPEAT == event && BUTTON_RIGHT == button)
  {
    if (both_pressed)
      hold_time += interval;
    else
      hold_time = 0;
  }

  if (hold_time > 2000)
  {
    counter_trim_mode = !counter_trim_mode;

    if (counter_trim_mode)
    {
      update_display();
    }
    else
    {
      oled_set_font(SMALL);
      oled_print(3, 0, "                 ");
    }

    hold_time = 0;
  }

  if (!counter_trim_mode || both_pressed)
    return;

  if (BUTTON_PRESSED == event || BUTTON_REPEAT == event)
  {
    if (BUTTON_RIGHT == button)
    {
      if (counter_cursor)
        counter_cursor--;
    }
    else if (BUTTON_LEFT == button)
    {
      if (counter_cursor < 7)
        counter_cursor++;
    }

    int64_t step = ipow(10, counter_cursor);

    if (BUTTON_UP == button)
    {
      if (g_config.xtal_trim <= (XTAL_TRIM_MAX - step))
        g_config.xtal_trim += step;

      update_pll_trim();
    }
    else if (BUTTON_DOWN == button)
    {
      if (g_config.xtal_trim >= (XTAL_TRIM_MIN + step))
        g_config.xtal_trim -= step;

      update_pll_trim();
    }
  }

  update_display();
}

//-----------------------------------------------------------------------------
static void show_gate(void)
{
  oled_set_font(SMALL);
  oled_putc(1, 8, 128);
  counter_gate_ind_off_time = get_system_time() + 50;

  if (counter_switch_block)
    counter_switch_block--;
}

//-----------------------------------------------------------------------------
static void update_gate_indicator(void)
{
  if (counter_gate_ind_off_time && get_system_time() > counter_gate_ind_off_time)
  {
    oled_set_font(SMALL);
    oled_putc(1, 8, ' ');
    counter_gate_ind_off_time = 0;
  }
}

//-----------------------------------------------------------------------------
static void update_mode(void)
{
  bool switch_mode = false;

  if (counter_switch_block)
    return;

  if (counter_gated_mode)
  {
    if (counter_freq < counter_switch_freq_lo)
      switch_mode = true;
  }
  else
  {
    if (counter_freq > counter_switch_freq_hi)
      switch_mode = true;
  }

  if (switch_mode)
  {
    counter_disable();
    counter_gated_mode = !counter_gated_mode;
    oled_clear_screen();
    update_battery_indicator(true);
    counter_enable();

    counter_switch_block = SWITCH_BLOCK_TIME;
  }
}

//-----------------------------------------------------------------------------
static void counter_gated_task(void)
{
  if (TCC0->INTFLAG.bit.MC0)
  {
    int64_t sample;
    int ovf;

    TCC0->INTFLAG.reg = TCC_INTFLAG_MC0;

    ovf = counter_ovf_cnt;
    counter_ovf_cnt = 0;

    sample = TCC0->CC[0].reg;
    sample += 0xffffff * ovf;
    sample *= counter_gate_mult;

    if (iabs(counter_freq - sample) > 10000)
    {
      counter_freq = sample;
    } 
    else
    {
      counter_freq -= counter_freq / 8;
      counter_freq += sample / 8;
    }

    show_gate();
    update_mode();
    update_display();
  }
}

//-----------------------------------------------------------------------------
static void counter_direct_task(void)
{
  static int zero_time = 0;

  if (TCC0->INTFLAG.bit.MC0)
  {
    TCC0->INTFLAG.reg = TCC_INTFLAG_MC0;

    counter_acc_a += TCC0->CC[0].reg;
    counter_acc_b += TCC0->CC[1].reg;
    counter_acc_cnt++;
    zero_time = 16;
  }

  if (TC1->COUNT32.INTFLAG.bit.MC1)
  {
    int ovf;

    TC1->COUNT32.INTFLAG.reg = TC_INTFLAG_MC1;

    if (0 == counter_acc_cnt || 0 == counter_acc_a)
    {
      if (zero_time > 0)
      {
        zero_time--;
        return;
      }
    }

    ovf = counter_ovf_cnt;
    counter_ovf_cnt = 0;

    counter_acc_a += 0xffffff * ovf;

    counter_freq = counter_pll_freq * counter_acc_cnt / counter_acc_a;

    update_display();

    oled_set_font(SMALL);

    if (0 == ovf)
    {
      int64_t dc = counter_acc_b * 10000 / counter_acc_a;
      print_dc(2, 92, -1, dc);
    }
    else
    {
      print_dc(2, 92, -1, 0);
    }

    counter_acc_a = 0;
    counter_acc_b = 0;
    counter_acc_cnt = 0;

    show_gate();
    update_mode();
  }
}

//-----------------------------------------------------------------------------
void counter_task(void)
{
  update_pll_lock_indicator();
  update_gate_indicator();

  if (counter_gated_mode)
    counter_gated_task();
  else
    counter_direct_task();
}


