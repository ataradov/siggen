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

#ifndef _CONFIG_H_
#define _CONFIG_H_

/*- Includes ----------------------------------------------------------------*/
#include <stdint.h>
#include <stdbool.h>

/*- Definitions -------------------------------------------------------------*/
enum
{
  CONFIG_MODE_GENERATOR,
  CONFIG_MODE_COUNTER,
};

enum
{
  CONFIG_GT_0_1S,
  CONFIG_GT_1S,
  CONFIG_GT_5S,
  CONFIG_GT_10S,
};

enum
{
  CONFIG_DF_ALWAYS_GATED,
  CONFIG_DF_1_kHz,
  CONFIG_DF_10_kHz,
  CONFIG_DF_100_kHz,
  CONFIG_DF_1_MHz,
};

enum
{
  CONFIG_BRIGHTNESS_LOW,
  CONFIG_BRIGHTNESS_MEDIUM,
  CONFIG_BRIGHTNESS_HIGH,
};

typedef struct
{
  uint32_t magic_1;
  int      xtal_trim;
  int      power_count;
  int      brightness;
  int      reserved_1[8];
  uint32_t magic_2;
  int      mode;
  int64_t  freq;
  int      dc;
  bool     on;
  int      gate_time;
  int      direct_freq;
  int      reserved_2[8];
  uint32_t magic_3;
} config_t;

_Static_assert(sizeof(config_t) < 256, "Config area size is too big");

/*- Prototypes --------------------------------------------------------------*/
void config_init(void);
void config_save(void);

/*- Variables ---------------------------------------------------------------*/
extern config_t g_config;

#endif // _CONFIG_H_


