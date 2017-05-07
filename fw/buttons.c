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
#include <stdint.h>
#include <stdbool.h>
#include <samd11.h>
#include "hal_gpio.h"
#include "buttons.h"
#include "globals.h"

/*- Definitions -------------------------------------------------------------*/
#define BUTTON_REPEAT_DELAY      200 // ms
#define BUTTON_REPEAT_INTERVAL   50 // ms

HAL_GPIO_PIN(BTN_U,    A, 25)
HAL_GPIO_PIN(BTN_D,    A, 24)
HAL_GPIO_PIN(BTN_L,    A, 30)
HAL_GPIO_PIN(BTN_R,    A, 31)
HAL_GPIO_PIN(BTN_C,    A, 9)

/* Proto
HAL_GPIO_PIN(BTN_U,    A, 25)
HAL_GPIO_PIN(BTN_D,    A, 31)
HAL_GPIO_PIN(BTN_L,    A, 2)
HAL_GPIO_PIN(BTN_R,    A, 30)
HAL_GPIO_PIN(BTN_C,    A, 24)
*/

/*- Variables ---------------------------------------------------------------*/
static bool buttons_state[N_BUTTONS];
static bool buttons_repeat[N_BUTTONS];
static int buttons_time[N_BUTTONS];

/*- Implementations ---------------------------------------------------------*/

//-----------------------------------------------------------------------------
void buttons_init(void)
{
  HAL_GPIO_BTN_U_in();
  HAL_GPIO_BTN_U_pullup();

  HAL_GPIO_BTN_D_in();
  HAL_GPIO_BTN_D_pullup();

  HAL_GPIO_BTN_L_in();
  HAL_GPIO_BTN_L_pullup();

  HAL_GPIO_BTN_R_in();
  HAL_GPIO_BTN_R_pullup();

  HAL_GPIO_BTN_C_in();
  HAL_GPIO_BTN_C_pullup();

  for (int i = 0; i < N_BUTTONS; i++)
  {
    buttons_state[i] = buttons_pressed(i);
    buttons_repeat[i] = false;
    buttons_time[i] = 0;
  }
}

//-----------------------------------------------------------------------------
bool buttons_pressed(int index)
{
  if (BUTTON_UP == index)
    return (0 == HAL_GPIO_BTN_U_read());
  else if (BUTTON_DOWN == index)
    return (0 == HAL_GPIO_BTN_D_read());
  else if (BUTTON_LEFT == index)
    return (0 == HAL_GPIO_BTN_L_read());
  else if (BUTTON_RIGHT == index)
    return (0 == HAL_GPIO_BTN_R_read());
  else if (BUTTON_RIGHT == index)
    return (0 == HAL_GPIO_BTN_R_read());
  else
    return (0 == HAL_GPIO_BTN_C_read());
}

//-----------------------------------------------------------------------------
void buttons_task(void)
{
  int sys_time = get_system_time();

  for (int i = 0; i < N_BUTTONS; i++)
  {
    bool new_state = buttons_pressed(i);
    int delta = sys_time - buttons_time[i];

    if (buttons_state[i])
    {
      int repeat_delta = buttons_repeat[i] ? BUTTON_REPEAT_INTERVAL : BUTTON_REPEAT_DELAY;

      if (delta > repeat_delta)
      {
        buttons_event(i, BUTTON_REPEAT, delta);
        buttons_time[i] = sys_time;
        buttons_repeat[i] = true;
      }
    }

    if (buttons_state[i] != new_state)
    {
      buttons_event(i, new_state ? BUTTON_PRESSED : BUTTON_RELEASED, delta);

      if (false == new_state)
        buttons_repeat[i] = false;

      buttons_state[i] = new_state;
      buttons_time[i] = sys_time;
    }
  }
}


