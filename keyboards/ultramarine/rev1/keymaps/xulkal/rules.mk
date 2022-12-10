RGBLIGHT_ENABLE = yes
# Enable RGBLIGHT Animations
OPT_DEFS += -DRGBLIGHT_ANIMATIONS
# Ultramarine specific define for correct RGBLED_NUM
OPT_DEFS += -DRGBLED_BACK

OLED_ENABLE = yes
OLED_DRIVER = SSD1306
# Ultramarine specific font file
OPT_DEFS += -DOLED_FONT_H=\"common/glcdfont.c\"
# Xulkal specific oled define
OPT_DEFS += -DOLED_90ROTATION

SPLIT_KEYBOARD = yes

# Explicitly disable ultramarine standard post-processing
KEYBOARD_LOCAL_FEATURES_MK :=
