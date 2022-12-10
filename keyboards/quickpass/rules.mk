# This file intentionally left blank
MCU = RP2040
BOOTLOADER = rp2040

# BOOTMAGIC_ENABLE = no
# MOUSEKEY_ENABLE = yes
# EXTRAKEY_ENABLE = yes
# CONSOLE_ENABLE = yes
# COMMAND_ENABLE = no
# NKRO_ENABLE = no
# BACKLIGHT_ENABLE = no
# RGBLIGHT_ENABLE = yes
# AUDIO_ENABLE = no

# WS2812_DRIVER = vendor
SERIAL_DRIVER = vendor

# BOARD = GENERIC_RP_RP2040

ENCODER_ENABLE = yes

# OLED_ENABLE = yes           # Display Feature
# OLED_DRIVER = SSD1306       # OLED SSD1306 128x32
# #ifeq ($(strip $(OLED_ENABLE)), yes)
# #    OLED_DRIVER_ENABLE = yes
# #endif