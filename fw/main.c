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
#include "globals.h"
#include "config.h"
#include "hal_gpio.h"
#include "buttons.h"
#include "ssd1306.h"
#include "nvm_data.h"
#include "menu.h"
#include "counter.h"
#include "generator.h"

/*- Definitions -------------------------------------------------------------*/
HAL_GPIO_PIN(PWR, A, 2)

#define SYM_BATTERY_0   130
#define SYM_BATTERY_1   131
#define SYM_BATTERY_2   132
#define SYM_BATTERY_3   133
#define SYM_BATTERY_4   134

/*- Prototypes --------------------------------------------------------------*/

/*- Variables ---------------------------------------------------------------*/
static volatile int app_system_time;
static bool app_menu_mode = false;

/*- Implementations ---------------------------------------------------------*/

//-----------------------------------------------------------------------------
static void sys_init(void)
{
  int coarse, fine;

  HAL_GPIO_PWR_out();
  HAL_GPIO_PWR_set();

  NVMCTRL->CTRLB.reg = NVMCTRL_CTRLB_RWS(2);

  // Configure external oscillator
  SYSCTRL->XOSC.reg = SYSCTRL_XOSC_ENABLE | SYSCTRL_XOSC_RUNSTDBY;
  while (0 == (SYSCTRL->PCLKSR.reg & SYSCTRL_PCLKSR_XOSCRDY));

  // Configure DFLL48 as a main system clock
  coarse = NVM_READ_CAL(NVM_DFLL48M_COARSE_CAL);
  fine = NVM_READ_CAL(NVM_DFLL48M_FINE_CAL);

  SYSCTRL->DFLLCTRL.reg = 0; // See Errata 9905
  while (0 == (SYSCTRL->PCLKSR.reg & SYSCTRL_PCLKSR_DFLLRDY));

  SYSCTRL->DFLLMUL.reg = SYSCTRL_DFLLMUL_MUL(48000);
  SYSCTRL->DFLLVAL.reg = SYSCTRL_DFLLVAL_COARSE(coarse) | SYSCTRL_DFLLVAL_FINE(fine);

  SYSCTRL->DFLLCTRL.reg = SYSCTRL_DFLLCTRL_ENABLE | SYSCTRL_DFLLCTRL_USBCRM |
      SYSCTRL_DFLLCTRL_MODE | SYSCTRL_DFLLCTRL_BPLCKC | SYSCTRL_DFLLCTRL_CCDIS |
      SYSCTRL_DFLLCTRL_STABLE;

  while (0 == (SYSCTRL->PCLKSR.reg & SYSCTRL_PCLKSR_DFLLRDY));

  GCLK->GENCTRL.reg = GCLK_GENCTRL_ID(0) | GCLK_GENCTRL_SRC(GCLK_SOURCE_DFLL48M) |
      GCLK_GENCTRL_RUNSTDBY | GCLK_GENCTRL_GENEN;
  while (GCLK->STATUS.reg & GCLK_STATUS_SYNCBUSY);
}

//-----------------------------------------------------------------------------
static void battery_init(void)
{
  PM->APBCMASK.reg |= PM_APBCMASK_ADC;

  GCLK->CLKCTRL.reg = GCLK_CLKCTRL_ID(ADC_GCLK_ID) |
      GCLK_CLKCTRL_CLKEN | GCLK_CLKCTRL_GEN(0);

  ADC->REFCTRL.reg = ADC_REFCTRL_REFSEL_INT1V | ADC_REFCTRL_REFCOMP;
  ADC->INPUTCTRL.reg = ADC_INPUTCTRL_MUXNEG_GND | ADC_INPUTCTRL_MUXPOS_SCALEDIOVCC;
  ADC->CTRLB.reg = ADC_CTRLB_RESSEL_12BIT | ADC_CTRLB_PRESCALER_DIV512 | ADC_CTRLB_FREERUN;
  ADC->CTRLA.reg = ADC_CTRLA_ENABLE;
  ADC->SWTRIG.reg = ADC_SWTRIG_START;
}

//-----------------------------------------------------------------------------
int battery_read(void)
{
  return (ADC->RESULT.reg * 1000) / (4096 / 4);
}

//-----------------------------------------------------------------------------
void power_off(void)
{
  while (buttons_pressed(BUTTON_CENTER));

  oled_clear_screen();

  HAL_GPIO_PWR_clr();
}

//-----------------------------------------------------------------------------
static void system_time_init(void)
{
  SysTick->VAL = 1;
  SysTick->LOAD = F_CPU / 1000ul;
  SysTick->CTRL = SysTick_CTRL_ENABLE_Msk | SysTick_CTRL_TICKINT_Msk;
  app_system_time = 0;
}

//-----------------------------------------------------------------------------
void irq_handler_sys_tick(void)
{
  app_system_time++;
}

//-----------------------------------------------------------------------------
int get_system_time(void)
{
  int t1, t2;

  do
  {
    t1 = app_system_time;
    t2 = app_system_time;
  } while (t1 != t2);
  
  return t2;
}

//-----------------------------------------------------------------------------
void sleep_ms(int ms)
{
  int end_time = get_system_time() + ms;

  while (get_system_time() < end_time);
}

//-----------------------------------------------------------------------------
void update_display_brightness(void)
{
  if (CONFIG_BRIGHTNESS_LOW == g_config.brightness)
    oled_set_brightness(0);
  else if (CONFIG_BRIGHTNESS_MEDIUM == g_config.brightness)
    oled_set_brightness(128);
  else
    oled_set_brightness(255);
}

//-----------------------------------------------------------------------------
void update_battery_indicator(bool force)
{
  static int next_update_time = 0;

  if (force || get_system_time() > next_update_time)
  {
    int vbat = battery_read();
    int symbol;

    oled_set_font(SMALL);

    if (vbat < 2000)
      symbol = SYM_BATTERY_0;
    else if (vbat < 2300)
      symbol = SYM_BATTERY_1;
    else if (vbat < 2500)
      symbol = SYM_BATTERY_2;
    else if (vbat < 2700)
      symbol = SYM_BATTERY_3;
    else
      symbol = SYM_BATTERY_4;

    oled_putc(1, 0, symbol);

    next_update_time = get_system_time() + 10000;

    // TODO: save settings and power off at some voltage ?
  }
}

//-----------------------------------------------------------------------------
void update_pll_lock_indicator(void)
{
  static int off_time = 0;
  int time = get_system_time();
  bool unlocked = SYSCTRL->INTFLAG.bit.DPLLLCKF;

  if (unlocked)
  {
    SYSCTRL->INTFLAG.reg = SYSCTRL_INTFLAG_DPLLLCKF;

    oled_set_font(SMALL);
    oled_putc(0, 8, 'U');
    off_time = time + 500;
  }

  if (off_time && time > off_time)
  {
    oled_set_font(SMALL);
    oled_putc(0, 8, ' ');
    off_time = 0;
  }
}

//-----------------------------------------------------------------------------
int64_t ipow(int base, int exp)
{
  int64_t res = 1;

  while (exp > 0)
  {
    if (exp & 1)
      res *= base;

    exp /= 2;
    base *= base;
  }

  return res;
}

//-----------------------------------------------------------------------------
int64_t iabs(int64_t value)
{
  if (value < 0)
    return -value;
  else
    return value;
}

//-----------------------------------------------------------------------------
int iitoa(char *buf, int value, int decimal, int sign)
{
  int rem = value;
  int ptr = 0;
  int i, j, tmp;

  if (rem < 0)
    rem = -rem;

  if (0 == rem)
    buf[ptr++] = '0';

  while (rem)
  {
    buf[ptr++] = rem % 10 + '0';
    rem = rem / 10;

    if (ptr == decimal)
      buf[ptr++] = '.';
  }

  if (-1 == sign && value < 0)
    buf[ptr++] = '-';
  else if (1 == sign)
    buf[ptr++] = (value > 0) ? '+' : '-';

  for (i = 0, j = ptr - 1; i < j; i++, j--)
  {
    tmp = buf[i];
    buf[i] = buf[j];
    buf[j] = tmp;
  }

  buf[ptr++] = 0;

  return ptr;
}

//-----------------------------------------------------------------------------
static void fmt_print_helper(int line, int x, int cursor, int size, int decimal, bool sign, int64_t value)
{
  const font_t *font = oled_get_font();
  int pos = (size + (size - decimal) / 6) * font->width + x;
  int64_t rem = value;
  bool negative = (value < 0);
  int first_space_pos = -1;
  char chr;

  if (negative)
    rem = -rem;

  if (sign)
    pos += font->width;

  for (int i = 0; i < size; i++)
  {
    chr = rem % 10 + '0';

    if (-1 != cursor)
    {
      oled_set_inverted(i == cursor);

      if (0 == rem && i > cursor && i >= (decimal + 1))
        chr = ' ';

      oled_putc(line, pos, chr);

      if (-1 == first_space_pos && ' ' == chr)
        first_space_pos = pos;

      oled_set_inverted(false);
    }
    else
    {
      if (0 == rem && i >= (decimal + 1))
        chr = ' ';

      oled_putc(line, pos, chr);

      if (-1 == first_space_pos && ' ' == chr)
        first_space_pos = pos;
    }

    rem = rem / 10;
    pos -= font->width;

    if (i > decimal && 0 == ((i - decimal + 1) % 3))
    {
      pos -= font->width / 2;
    }
    else if (i == (decimal - 1))
    {
      oled_putc(line, pos, '.');
      pos -= font->width;
    }
  }

  if (sign)
  {
    if (first_space_pos > 0)
    {
      oled_putc(line, pos, ' ');
      oled_putc(line, first_space_pos, negative ? '-' : '+');
    }
    else
    {
      oled_putc(line, pos, negative ? '-' : '+');
    }
  }
}

//-----------------------------------------------------------------------------
void print_freq(int line, int x, int cursor, int64_t freq)
{
  fmt_print_helper(line, x, cursor, 12, 3, false, freq);
}

//-----------------------------------------------------------------------------
void print_freq_sign(int line, int x, int cursor, int64_t freq)
{
  fmt_print_helper(line, x, cursor, 8, 3, true, freq);
}

//-----------------------------------------------------------------------------
void print_dc(int line, int x, int cursor, int dc)
{
  fmt_print_helper(line, x, cursor, 5, 2, false, dc);
}

//-----------------------------------------------------------------------------
void set_menu_mode(void)
{
  if (CONFIG_MODE_GENERATOR == g_config.mode)
    generator_disable();
  else
    counter_disable();

  app_menu_mode = true;
  oled_clear_screen();
  menu_init();
}

//-----------------------------------------------------------------------------
void set_operation_mode(void)
{
  app_menu_mode = false;

  oled_clear_screen();
  update_battery_indicator(true);

  if (CONFIG_MODE_GENERATOR == g_config.mode)
    generator_enable();
  else
    counter_enable();
}

//-----------------------------------------------------------------------------
void buttons_event(int button, int event, int interval)
{
  if (app_menu_mode)
    menu_buttons_event(button, event, interval);
  else if (CONFIG_MODE_GENERATOR == g_config.mode)
    generator_buttons_event(button, event, interval);
  else
    counter_buttons_event(button, event, interval);
}

//-----------------------------------------------------------------------------
int main(void)
{
  sys_init();
  config_init();
  battery_init();
  system_time_init();
  buttons_init();
  oled_init();
  update_display_brightness();
  menu_init();
  counter_init();
  generator_init();
  set_operation_mode();

  while (1)
  {
    buttons_task();

    if (app_menu_mode)
    {
      menu_task();
    }
    else
    {
      update_battery_indicator(false);

      if (CONFIG_MODE_GENERATOR == g_config.mode)
        generator_task();
      else
        counter_task();
    }
  }

  return 0;
}


