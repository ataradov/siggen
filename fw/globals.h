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

#ifndef _GLOBALS_H_
#define _GLOBALS_H_

/*- Includes ----------------------------------------------------------------*/
#include <stdint.h>
#include <stdbool.h>
#include "samd11.h"

/*- Definitions -------------------------------------------------------------*/
#define APP_VERSION    "0.1"

#define SMALL          &font_6x8
#define BIG            &terminus_8x14

#define Hz             1000
#define kHz            1000000
#define MHz            1000000000

/*- Prototypes --------------------------------------------------------------*/
int get_system_time(void);
void sleep_ms(int ms);
int battery_read(void);
void power_off(void);

void set_menu_mode(void);
void set_operation_mode(void);
void update_battery_indicator(bool force);
void update_pll_lock_indicator(void);
void update_display_brightness(void);

int64_t ipow(int base, int exp);
int64_t iabs(int64_t value);
int iitoa(char *buf, int value, int decimal, int sign);

void print_freq(int line, int x, int cursor, int64_t freq);
void print_freq_sign(int line, int x, int cursor, int64_t freq);
void print_dc(int line, int x, int cursor, int dc);

#endif // _GLOBALS_H_


