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
#include <string.h>
#include <stdbool.h>
#include "globals.h"
#include "buttons.h"
#include "ssd1306.h"
#include "config.h"

/*- Definitions -------------------------------------------------------------*/
#define DISPLAY_LINES          4
#define MAX_LINE_LENGTH        18

#define CURSOR_POSITION        0
#define TEXT_POSITION          9
#define ACTION_POSITION        122

#define CHR_SUBMENU            127
#define CHR_CURSOR             128
#define CHR_ACTION             129

#define POWER_OFF_TIMEOUT      2000 // ms

/*- Types -------------------------------------------------------------------*/
typedef struct
{
  const char   **submenu;
  int          *value;
} menu_items_t;

/*- Prototypes --------------------------------------------------------------*/
static void menu_select_main(void);
static void menu_select_submenu(const char **str, int index);
static void menu_redraw(void);
static void menu_main_action(int index);
static void menu_submenu_action(int index, int value);

/*- Constants ---------------------------------------------------------------*/
static const char *operating_mode_str[] =
{
  "Generator",
  "Counter / Meter",
  NULL
};

static const char *preset_freq_str[] =
{
  "  1 Hz",
  " 10 Hz",
  "100 Hz",
  "  1 kHz",
  " 10 kHz",
  "100 kHz",
  "  1 MHz",
  " 10 MHz",
  "100 MHz",
  NULL
};

static const char *preset_dc_str[] =
{
  "10 %",
  "20 %",
  "30 %",
  "40 %",
  "50 %",
  "60 %",
  "70 %",
  "80 %",
  "90 %",
  NULL
};

static const char *gate_time_str[] =
{
  "0.1 second",
  "1 second",
  "5 seconds",
  "10 seconds",
  NULL
};

static const char *direct_freq_str[] =
{
  "Always Gated",
  "1 kHz",
  "10 kHz",
  "100 kHz",
  "1 MHz",
  NULL
};

static const char *display_brightness_str[] =
{
  "Low",
  "Medium",
  "High",
  NULL
};

enum
{
  MENU_ITEM_OPERATING_MODE,
  MENU_ITEM_PRESET_FREQUENCY,
  MENU_ITEM_PRESET_DC,
  MENU_ITEM_GATE_TIME,
  MENU_ITEM_DIRECT_THRESHOLD,
  MENU_ITEM_DISPLAY_BRIGHTNESS,
  MENU_ITEM_SYSTEM_INFORMATION,
  MENU_ITEM_POWER_OFF,
};

static const char *main_menu_str[] =
{
  "Operating Mode",
  "Preset Frequency",
  "Preset Duty Cycle",
  "Gate Time",
  "Direct Frequency",
  "Display Brightness",
  "System Information",
  "Power Off",
  NULL
};

static const menu_items_t menu_items[] =
{
  { operating_mode_str, &g_config.mode },
  { preset_freq_str, NULL },
  { preset_dc_str, NULL },
  { gate_time_str, &g_config.gate_time },
  { direct_freq_str, &g_config.direct_freq },
  { display_brightness_str, &g_config.brightness },
  { NULL, NULL },
  { NULL, NULL },
};

/*- Variables ---------------------------------------------------------------*/
static int menu_size;
static int menu_cursor;
static int menu_offset;
static bool menu_main;
static const char **menu_str;
static int menu_main_cursor;
static int menu_main_offset;
static bool menu_static;
static int menu_power_off_time;

/*- Implementations ---------------------------------------------------------*/

//-----------------------------------------------------------------------------
void menu_init(void)
{
  oled_set_font(SMALL);

  menu_static = false;
  menu_main_cursor = 0;
  menu_main_offset = 0;
  menu_power_off_time = get_system_time() + POWER_OFF_TIMEOUT;
  menu_select_main();
}

//-----------------------------------------------------------------------------
static void menu_select_main(void)
{
  menu_main = true;
  menu_str = main_menu_str;
  menu_cursor = menu_main_cursor;
  menu_offset = menu_main_offset;

  for (menu_size = 0; menu_str[menu_size]; menu_size++);
}

//-----------------------------------------------------------------------------
static void menu_select_submenu(const char **str, int index)
{
  int lines;

  menu_main = false;
  menu_str = str;
  menu_main_cursor = menu_cursor;
  menu_main_offset = menu_offset;

  for (menu_size = 0; menu_str[menu_size]; menu_size++);

  lines = (menu_size < DISPLAY_LINES) ? menu_size : DISPLAY_LINES;

  menu_cursor = (0 == index) ? 0 : 1;
  menu_offset = index - menu_cursor;

  if (menu_offset > (menu_size - lines))
  {
    int delta = menu_offset - (menu_size - lines);
    menu_cursor += delta;
    menu_offset -= delta;
  }
}

//-----------------------------------------------------------------------------
static void menu_redraw(void)
{
  static int old_cursor = 0;
  char text[MAX_LINE_LENGTH + 1];
  int lines = (menu_size < DISPLAY_LINES) ? menu_size : DISPLAY_LINES;
  int action;

  // Draw cursors
  if (menu_cursor != old_cursor)
  {
    oled_putc(old_cursor, CURSOR_POSITION, ' ');
    oled_putc(old_cursor, ACTION_POSITION, ' ');
    old_cursor = menu_cursor;
  }

  if (menu_main)
    action = menu_items[menu_offset + menu_cursor].submenu ? CHR_SUBMENU : CHR_ACTION;
  else
    action = CHR_ACTION;

  oled_putc(menu_cursor, CURSOR_POSITION, CHR_CURSOR);
  oled_putc(menu_cursor, ACTION_POSITION, action);

  // Draw text
  text[MAX_LINE_LENGTH] = 0;

  for (int i = 0; i < lines; i++)
  {
    const char *ptr = menu_str[menu_offset + i];
    bool fill = false;

    for (int j = 0; j < MAX_LINE_LENGTH; j++)
    {
      if (!fill)
      {
        if (0 == ptr[j])
          fill = true;
        else
          text[j] = ptr[j];
      }

      if (fill)
        text[j] = ' ';
    }

    oled_print(i, TEXT_POSITION, text);
  }
}

//-----------------------------------------------------------------------------
static void menu_power_off(void)
{
  oled_set_font(BIG);
  oled_clear_screen();
  oled_print(1, 28, "Good Bye!");

  config_save();

  sleep_ms(500);
  power_off();
}

//-----------------------------------------------------------------------------
void menu_buttons_event(int button, int event, int interval)
{
  int lines = (menu_size < DISPLAY_LINES) ? menu_size : DISPLAY_LINES;
  int index = menu_offset + menu_cursor;

  if (menu_static)
  {
    if (BUTTON_PRESSED == event)
    {
      menu_static = false;
      oled_clear_screen();
      menu_redraw();
    }

    return;
  }

  if (BUTTON_PRESSED == event || BUTTON_REPEAT == event)
  {
    if (BUTTON_UP == button)
    {
      if (0 == menu_cursor)
        menu_offset--;
      else
        menu_cursor--;

      if (-1 == menu_offset)
      {
        menu_cursor = lines - 1;
        menu_offset = menu_size - lines;
      }
    }
    else if (BUTTON_DOWN == button)
    {
      if ((lines - 1) == menu_cursor)
        menu_offset++;
      else
        menu_cursor++;

      if ((menu_size - (lines - 1)) == menu_offset)
      {
        menu_cursor = 0;
        menu_offset = 0;
      }
    }
  }

  if (BUTTON_PRESSED == event)
  {
    if (BUTTON_RIGHT == button)
    {
      if (menu_main && menu_items[index].submenu)
      {
        int value = menu_items[index].value ? *menu_items[index].value : 0;
        menu_select_submenu(menu_items[index].submenu, value);
        oled_clear_screen();
      }
    }
    else if (BUTTON_LEFT == button)
    {
      if (menu_main)
      {
        set_operation_mode();
        return;
      }
      else
      {
        menu_select_main();
        oled_clear_screen();
      }
    }
    else if (BUTTON_CENTER == button)
    {
      if (menu_main)
      {
        if (menu_items[index].submenu)
        {
          int value = menu_items[index].value ? *menu_items[index].value : 0;
          menu_select_submenu(menu_items[index].submenu, value);
          oled_clear_screen();
        }
        else
        {
          menu_main_action(index);
        }
      }
      else
      {
        int main_index = menu_main_offset + menu_main_cursor;

        if (menu_items[main_index].value)
          *menu_items[main_index].value = index;

        menu_submenu_action(main_index, index);

        menu_select_main();
        oled_clear_screen();
      }
    }
  }

  if (BUTTON_RELEASED == event && BUTTON_CENTER == button)
    menu_power_off_time = 0;

  if (!menu_static)
    menu_redraw();

  (void)interval;
}

//-----------------------------------------------------------------------------
static void menu_main_action(int index)
{
  if (MENU_ITEM_SYSTEM_INFORMATION == index)
  {
    char buf[10];

    oled_clear_screen();
    oled_print(0, 0, "Version: " APP_VERSION);
    oled_print(1, 0, "Built  : " __DATE__);
    oled_print(2, 0, "Battery: x.xx V");
    oled_print(3, 0, "Reboots:");

    iitoa(buf, battery_read(), 3, 0);
    buf[4] = 0;
    oled_print(2, 54, buf);

    iitoa(buf, g_config.power_count, 0, 0);
    oled_print(3, 54, buf);

    sleep_ms(200);

    menu_static = true;
  }
  else if (MENU_ITEM_POWER_OFF == index)
  {
    menu_power_off();
  }
}

//-----------------------------------------------------------------------------
static void menu_submenu_action(int index, int value)
{
  if (MENU_ITEM_PRESET_FREQUENCY == index)
  {
    g_config.freq = ipow(10, value) * 1000;
  }
  else if (MENU_ITEM_PRESET_DC == index)
  {
    g_config.dc = (value + 1) * 1000;
  }
  else if (index == MENU_ITEM_DISPLAY_BRIGHTNESS)
  {
    update_display_brightness();
  }
}

//-----------------------------------------------------------------------------
void menu_task(void)
{
  if (menu_power_off_time && get_system_time() > menu_power_off_time)
  {
    menu_power_off();
  }
}


