// Copyright 2022 Chrodream (@Chrodream)
// SPDX-License-Identifier: GPL-2.0-or-later

#pragma once

/*
 * Feature disable options
 *  These options are also useful to firmware size reduction.
 */

/* disable debug print */
//#define NO_DEBUG

/* disable print */
//#define NO_PRINT

/* disable action features */
//#define NO_ACTION_LAYER
//#define NO_ACTION_TAPPING
//#define NO_ACTION_ONESHOT

#define MATRIX_ROW_PINS { GP9 }
#define MATRIX_COL_PINS { GP6, GP7, GP8 ,GP10, GP19, GP20}
/*#define UNUSED_PINS*/

/* COL2ROW, ROW2COL*/
#define DIODE_DIRECTION COL2ROW

#define NUMBER_OF_ENCODERS 1
#define ENCODERS_PAD_A { GP4 }
#define ENCODERS_PAD_B { GP5 }

// #define SERIAL_USART_FULL_DUPLEX
// #define SERIAL_USART_TX_PIN GP0
// #define SERIAL_USART_RX_PIN GP1

// #define SERIAL_DEBUG

/*
 * Display OLED SSD1306 128x32
 */
// #define OLED_DISPLAY_ADDRESS 0x3C
// #define OLED_BRIGHTNESS 255
// #define OLED_IC OLED_IC_SSD1306
// #define OLED_DISPLAY_WIDTH 128
// #define OLED_DISPLAY_HEIGHT 32
// #define OLED_TIMEOUT 31000