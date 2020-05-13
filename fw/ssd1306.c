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
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include "samd11.h"
#include "hal_gpio.h"
#include "ssd1306.h"
#include "fonts.h"

/*- Definitions -------------------------------------------------------------*/
HAL_GPIO_PIN(OLED_SCL,        A, 5);
HAL_GPIO_PIN(OLED_SDA,        A, 4);

#define OLED_SERCOM           SERCOM0
#define OLED_SERCOM_PMUX      PORT_PMUX_PMUXE_D_Val
#define OLED_SERCOM_GCLK_ID   SERCOM0_GCLK_ID_CORE
#define OLED_SERCOM_APBCMASK  PM_APBCMASK_SERCOM0
#define OLED_SERCOM_CLK_GEN   0
#define OLED_SERCOM_BAUD      40 // Depends on the system clock and board layout

#define OLED_I2C_ADDRESS      0x78

#define OLED_WIDTH            128
#define OLED_HEIGHT           32
#define OLED_PAGES            (OLED_HEIGHT / 8)
#define OLED_FB_SIZE          ((OLED_WIDTH * OLED_HEIGHT) / 8)

#define SSD1306_CMD_COL_ADD_SET_LSB(column)         (0x00 | (column))
#define SSD1306_CMD_COL_ADD_SET_MSB(column)         (0x10 | (column))
#define SSD1306_CMD_SET_MEMORY_ADDRESSING_MODE      0x20
#define SSD1306_CMD_SET_COLUMN_ADDRESS              0x21
#define SSD1306_CMD_SET_PAGE_ADDRESS                0x22
#define SSD1306_CMD_SET_DISPLAY_START_LINE(line)    (0x40 | (line))
#define SSD1306_CMD_SET_CONTRAST_CONTROL_FOR_BANK0  0x81
#define SSD1306_CMD_SET_CHARGE_PUMP_SETTING         0x8d
#define SSD1306_CMD_SET_SEGMENT_RE_MAP_COL0_SEG0    0xa0
#define SSD1306_CMD_SET_SEGMENT_RE_MAP_COL127_SEG0  0xa1
#define SSD1306_CMD_ENTIRE_DISPLAY_AND_GDDRAM_ON    0xa4
#define SSD1306_CMD_ENTIRE_DISPLAY_ON               0xa5
#define SSD1306_CMD_SET_NORMAL_DISPLAY              0xa6
#define SSD1306_CMD_SET_INVERSE_DISPLAY             0xa7
#define SSD1306_CMD_SET_MULTIPLEX_RATIO             0xa8
#define SSD1306_CMD_SET_DISPLAY_ON                  0xaf
#define SSD1306_CMD_SET_DISPLAY_OFF                 0xae
#define SSD1306_CMD_SET_PAGE_START_ADDRESS(page)    (0xb0 | (page))
#define SSD1306_CMD_SET_COM_OUTPUT_SCAN_UP          0xc0
#define SSD1306_CMD_SET_COM_OUTPUT_SCAN_DOWN        0xc8
#define SSD1306_CMD_SET_DISPLAY_OFFSET              0xd3
#define SSD1306_CMD_SET_DISPLAY_CLOCK_DIVIDE_RATIO  0xd5
#define SSD1306_CMD_SET_PRE_CHARGE_PERIOD           0xd9
#define SSD1306_CMD_SET_COM_PINS                    0xda
#define SSD1306_CMD_SET_VCOMH_DESELECT_LEVEL        0xdb
#define SSD1306_CMD_NOP                             0xe3
#define SSD1306_CMD_SCROLL_H_RIGHT                  0x26
#define SSD1306_CMD_SCROLL_H_LEFT                   0x27
#define SSD1306_CMD_CONTINUOUS_SCROLL_V_AND_H_RIGHT 0x29
#define SSD1306_CMD_CONTINUOUS_SCROLL_V_AND_H_LEFT  0x2a
#define SSD1306_CMD_DEACTIVATE_SCROLL               0x2e
#define SSD1306_CMD_ACTIVATE_SCROLL                 0x2f
#define SSD1306_CMD_SET_VERTICAL_SCROLL_AREA        0xa3

#define SSD1306_DATA         0x40
#define SSD1306_COMMAND      0x00

#define I2C_TRANSFER_WRITE   0
#define I2C_TRANSFER_READ    1

/*- Prototypes --------------------------------------------------------------*/
void sleep_ms(int ms);

/*- Variables ---------------------------------------------------------------*/
static const font_t *oled_font = NULL;
static bool oled_inverted = false;

/*- Implementations ---------------------------------------------------------*/

//-----------------------------------------------------------------------------
static void i2c_init(void)
{
  HAL_GPIO_OLED_SCL_pmuxen(OLED_SERCOM_PMUX);
  HAL_GPIO_OLED_SDA_pmuxen(OLED_SERCOM_PMUX);

  PM->APBCMASK.reg |= OLED_SERCOM_APBCMASK;

  GCLK->CLKCTRL.reg = GCLK_CLKCTRL_ID(OLED_SERCOM_GCLK_ID) |
      GCLK_CLKCTRL_CLKEN | GCLK_CLKCTRL_GEN(OLED_SERCOM_CLK_GEN);

  OLED_SERCOM->I2CM.CTRLB.reg = SERCOM_I2CM_CTRLB_SMEN;

  OLED_SERCOM->I2CM.BAUD.reg = SERCOM_I2CM_BAUD_BAUD(OLED_SERCOM_BAUD);

  OLED_SERCOM->I2CM.CTRLA.reg = SERCOM_I2CM_CTRLA_ENABLE |
      SERCOM_I2CM_CTRLA_MODE_I2C_MASTER |
      SERCOM_I2CM_CTRLA_SDAHOLD(3);

  OLED_SERCOM->I2CM.STATUS.reg |= SERCOM_I2CM_STATUS_BUSSTATE(1);
}

//-----------------------------------------------------------------------------
static void i2c_start(void)
{
  OLED_SERCOM->I2CM.ADDR.reg = OLED_I2C_ADDRESS | I2C_TRANSFER_WRITE;

  while (0 == OLED_SERCOM->I2CM.INTFLAG.bit.MB &&
         0 == OLED_SERCOM->I2CM.INTFLAG.bit.SB);
}

//-----------------------------------------------------------------------------
static void i2c_write_byte(int data)
{
  OLED_SERCOM->I2CM.DATA.reg = data;

  while (0 == OLED_SERCOM->I2CM.INTFLAG.bit.MB);
}

//-----------------------------------------------------------------------------
static void i2c_stop()
{
  if (OLED_SERCOM->I2CM.INTFLAG.bit.MB || OLED_SERCOM->I2CM.INTFLAG.bit.SB)
    OLED_SERCOM->I2CM.CTRLB.reg |= SERCOM_I2CM_CTRLB_CMD(3);
}

//-----------------------------------------------------------------------------
static void oled_set_address(int page, int x)
{
  i2c_start();
  i2c_write_byte(SSD1306_COMMAND);

  i2c_write_byte(SSD1306_CMD_SET_COLUMN_ADDRESS);
  i2c_write_byte(x);
  i2c_write_byte(OLED_WIDTH - 1);

  i2c_write_byte(SSD1306_CMD_SET_PAGE_ADDRESS);
  i2c_write_byte(page);
  i2c_write_byte(OLED_PAGES - 1);
  
  i2c_stop();
} 

//-----------------------------------------------------------------------------
void oled_init(void)
{
  uint8_t commands[] = {
    SSD1306_CMD_SET_MULTIPLEX_RATIO, 0x1f,
    SSD1306_CMD_SET_DISPLAY_OFFSET, 0,
    SSD1306_CMD_SET_DISPLAY_START_LINE(0),
    SSD1306_CMD_SET_SEGMENT_RE_MAP_COL127_SEG0,
    SSD1306_CMD_SET_COM_OUTPUT_SCAN_DOWN,
    SSD1306_CMD_SET_COM_PINS, 2,
    SSD1306_CMD_SET_CONTRAST_CONTROL_FOR_BANK0, 0x7f,
    SSD1306_CMD_ENTIRE_DISPLAY_AND_GDDRAM_ON,
    SSD1306_CMD_SET_NORMAL_DISPLAY,
    SSD1306_CMD_SET_DISPLAY_CLOCK_DIVIDE_RATIO, 0x80,
    SSD1306_CMD_SET_CHARGE_PUMP_SETTING, 0x14,
    SSD1306_CMD_SET_VCOMH_DESELECT_LEVEL, 0x40,
    SSD1306_CMD_SET_PRE_CHARGE_PERIOD, 0xf1,
    SSD1306_CMD_SET_MEMORY_ADDRESSING_MODE, 0,
    SSD1306_CMD_SET_DISPLAY_ON,
  };

  sleep_ms(2000);

  i2c_init();
  i2c_start();

  i2c_write_byte(SSD1306_COMMAND);

  for (int i = 0; i < (int)sizeof(commands); i++)
    i2c_write_byte(commands[i]);

  i2c_stop();

  oled_clear_screen();
}

//-----------------------------------------------------------------------------
void oled_clear_screen(void)
{
  oled_set_address(0, 0);

  i2c_start();
  i2c_write_byte(SSD1306_DATA);

  for (int i = 0; i < (OLED_WIDTH * OLED_PAGES); i++)
    i2c_write_byte(0);

  i2c_stop();
}

//-----------------------------------------------------------------------------
void oled_set_brightness(int level)
{
  i2c_start();
  i2c_write_byte(SSD1306_COMMAND);
  i2c_write_byte(SSD1306_CMD_SET_CONTRAST_CONTROL_FOR_BANK0);
  i2c_write_byte(level);
  i2c_stop();
}

//-----------------------------------------------------------------------------
void oled_set_font(const font_t *font)
{
  oled_font = font;
}

//-----------------------------------------------------------------------------
const font_t *oled_get_font(void)
{
  return oled_font;
}

//-----------------------------------------------------------------------------
void oled_set_inverted(bool inverted)
{
  oled_inverted = inverted;
}

//-----------------------------------------------------------------------------
void oled_print(int line, int x, char *text)
{
  int font_lines;

  if (NULL == oled_font)
    return;

  font_lines = oled_font->height / 8;

  for (int l = 0; l < font_lines; l++)
  {
    char *buf = text;

    oled_set_address(line + l, x);

    i2c_start();
    i2c_write_byte(SSD1306_DATA);

    while (*buf)
    {
      int c = *buf++ - ' ';
      int offs = c * oled_font->width * font_lines + l * 8;

      for (int j = 0; j < oled_font->width; j++)
      {
        int byte = oled_font->data[offs + j];
        i2c_write_byte(oled_inverted ? ~byte : byte);
      }
    }

    i2c_stop();
  }
}

//-----------------------------------------------------------------------------
void oled_putc(int line, int x, char chr)
{
  char buf[2] = { chr, 0 };

  oled_print(line, x, buf);
}

