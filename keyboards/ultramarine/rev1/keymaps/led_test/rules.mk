# QMK Standard Build Options
#   change to "no" to disable the options, or define them in the Makefile in
#   the appropriate keymap folder that will get included automatically
#
#   See TOP/keyboards/ultramarine/rules.mk for a list of options that can be set.
#   See TOP/docs/config_options.md for more information.
#
SPLIT_KEYBOARD = yes

LTO_ENABLE = no  # if firmware size over limit, try this option

# Ultramarine Spacific Build Options
# you can uncomment and edit follows 7 Variables
#  jp: 以下の7つの変数を必要に応じて編集し、コメントアウトをはずします。
# ULTRAMARINE_ROWS = 5              # Ultramarine Rows is 4 or 5
OLED_ENABLE = yes            # OLED_ENABLE
# LOCAL_GLCDFONT = no         # use each keymaps "ultramarinefont.h" insted of "common/glcdfont.c"
LED_BACK_ENABLE = yes        # LED backlight (Enable WS2812 RGB underlight.)
LED_UNDERGLOW_ENABLE = no    # LED underglow (Enable WS2812 RGB underlight.)
LED_ANIMATIONS = yes         # LED animations
# IOS_DEVICE_ENABLE = no      # connect to IOS device (iPad,iPhone)

OLED_SELECT = core
ifeq ($(strip $(OLED_ENABLE)), yes)
    SRC += oled_display.c
endif
SRC += led_test_init.c
