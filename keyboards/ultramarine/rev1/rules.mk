KEYBOARD_LOCAL_FEATURES_MK := $(dir $(lastword $(MAKEFILE_LIST)))local_features.mk

SPLIT_KEYBOARD = yes

# Ultramarine Spacific Build Options default values
ULTRAMARINE_ROWS = 5              # Ultramarine Rows is 4 or 5
OLED_ENABLE = yes           # OLED_ENABLE
LOCAL_GLCDFONT = no         # use each keymaps "ultramarinefont.h" insted of "common/glcdfont.c"
LED_BACK_ENABLE = no        # LED backlight (Enable WS2812 RGB underlight.)
LED_UNDERGLOW_ENABLE = no   # LED underglow (Enable WS2812 RGB underlight.)
LED_ANIMATIONS = yes        # LED animations
IOS_DEVICE_ENABLE = yes     # connect to IOS device (iPad,iPhone)
