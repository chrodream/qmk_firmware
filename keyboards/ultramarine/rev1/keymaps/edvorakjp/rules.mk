# QMK Standard Build Options
#   change to "no" to disable the options, or define them in the Makefile in
#   the appropriate keymap folder that will get included automatically
#
#   See TOP/keyboards/ultramarine/rules.mk for a list of options that can be set.
#   See TOP/docs/config_options.md for more information.
#
SPLIT_KEYBOARD = yes
LTO_ENABLE = no  # if firmware size over limit, try this option
TAP_DANCE_ENABLE = yes

# Ultramarine Spacific Build Options
# you can uncomment and edit follows 7 Variables
#  jp: 以下の7つの変数を必要に応じて編集し、コメントアウトをはずします。
# ULTRAMARINE_ROWS = 5              # Ultramarine Rows is 4 or 5
# OLED_ENABLE = no            # OLED_ENABLE
# LOCAL_GLCDFONT = no         # use each keymaps "ultramarinefont.h" instead of "common/glcdfont.c"
# LED_BACK_ENABLE = no        # LED backlight (Enable WS2812 RGB underlight.)
# LED_UNDERGLOW_ENABLE = no   # LED underglow (Enable WS2812 RGB underlight.)
# LED_ANIMATIONS = yes        # LED animations
# IOS_DEVICE_ENABLE = no      # connect to IOS device (iPad,iPhone)
OLED_SELECT = core

# convert Ultramarine-specific options (that represent combinations of standard options)
#   into QMK standard options.
include $(strip $(KEYBOARD_LOCAL_FEATURES_MK))

ifeq ($(strip $(ULTRAMARINE_ROWS)), 4)
  SRC += keymap_4rows.c
else ifeq ($(strip $(ULTRAMARINE_ROWS)), 5)
  SRC += keymap_5rows.c
endif

ifeq ($(strip $(LED_UNDERGLOW_ENABLE)), yes)
  OPT_DEFS += -DRGBLED_BACK
endif

ifeq ($(strip $(OLED_ENABLE)), yes)
  SRC += oled.c
endif
