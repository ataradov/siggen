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
#include <string.h>
#include <stdalign.h>
#include "samd11.h"
#include "globals.h"
#include "config.h"

/*- Definitions -------------------------------------------------------------*/
#define PAGES_IN_ERASE_BLOCK  NVMCTRL_ROW_PAGES
#define ERASE_BLOCK_SIZE      NVMCTRL_ROW_SIZE
#define FLASH_PAGE_SIZE_WORDS (int)(FLASH_PAGE_SIZE / sizeof(uint32_t))

#define CONFIG_OFFSET         16128
#define CONFIG_MAGIC          0x78656c41

/*- Variables ---------------------------------------------------------------*/
config_t g_config;

/*- Implementations ---------------------------------------------------------*/

//-----------------------------------------------------------------------------
void config_init(void)
{
  memcpy((uint8_t *)&g_config, (uint8_t *)CONFIG_OFFSET, sizeof(config_t));

  if (CONFIG_MAGIC != g_config.magic_1 || CONFIG_MAGIC != g_config.magic_2)
  {
    g_config.magic_1        = CONFIG_MAGIC;
    g_config.magic_2        = CONFIG_MAGIC;
    g_config.xtal_trim      = 0;
    g_config.power_count    = 0;
    g_config.brightness     = CONFIG_BRIGHTNESS_MEDIUM;
  }

  if (CONFIG_MAGIC != g_config.magic_2 || CONFIG_MAGIC != g_config.magic_3)
  {
    g_config.magic_2        = CONFIG_MAGIC;
    g_config.magic_3        = CONFIG_MAGIC;
    g_config.mode           = CONFIG_MODE_GENERATOR;
    g_config.freq           = 1 * kHz;
    g_config.dc             = 5000;
    g_config.on             = false;
    g_config.gate_time      = CONFIG_GT_1S;
    g_config.direct_freq    = CONFIG_DF_100_kHz;
  }

  g_config.power_count++;
}

//-----------------------------------------------------------------------------
void config_save(void)
{
  alignas(4) uint8_t data[ERASE_BLOCK_SIZE];
  uint32_t *flash_offset = (uint32_t *)CONFIG_OFFSET;
  uint32_t *flash_data = (uint32_t *)data;

  memcpy(data, (uint8_t *)&g_config, sizeof(config_t));

  NVMCTRL->ADDR.reg = CONFIG_OFFSET >> 1;

  NVMCTRL->CTRLA.reg = NVMCTRL_CTRLA_CMDEX_KEY | NVMCTRL_CTRLA_CMD_ER;
  while (0 == NVMCTRL->INTFLAG.bit.READY);

  for (int page = 0; page < PAGES_IN_ERASE_BLOCK; page++)
  {
    for (int i = 0; i < FLASH_PAGE_SIZE_WORDS; i++)
      *flash_offset++ = *flash_data++;

    while (0 == NVMCTRL->INTFLAG.bit.READY);
  }
}


