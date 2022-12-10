#
#  local_features.mk contains post-processing rules for the Ultramarine keyboard.
#
#   Post-processing rules convert keyboard-specific shortcuts (that represent
#   combinations of standard options) into QMK standard options.
#

KEYBOARD_LOCAL_FEATURES_MK :=
-include $(strip $(ULTRAMARINE_TOP_DIR)/rev1/override_ultramarine_options.mk) ## File dedicated to maintenance

# Parse 'ULTRAMARINE=xx,yy,zz' option
ifneq ($(strip $(ULTRAMARINE)),)
    # make ULTRAMARINE=ios ultramarine/pico:AKEYMAP
    # make ULTRAMARINE=no-ani ultramarine/pico:AKEYMAP
    # make ULTRAMARINE=no-oled ultramarine/pico:AKEYMAP
    # make ULTRAMARINE=ios,no-ani,no-oled ultramarine/pico:AKEYMAP
    define ULTRAMARINE_OPTION_PARSE
        # parce 'no-ani' 'ios' 'no-oled'
        $(if $(SHOW_PARCE),$(info parse .$1.))  #debug
        $(if $(ULTRAMARINE_OVERRIDE_PARSE),$(call ULTRAMARINE_OVERRIDE_PARSE,$1))

      ifeq ($(strip $1),ios)
        IOS_DEVICE_ENABLE = yes
      endif
      ifneq ($(filter na no_ani no-ani,$(strip $1)),)
        LED_ANIMATIONS = no
      endif
      ifneq ($(filter nooled no-oled,$(strip $1)),)
        OLED_ENABLE = no
      endif
      ifeq ($(strip $1),oled)
        OLED_ENABLE = yes
      endif
    endef # end of ULTRAMARINE_OPTION_PARSE

    COMMA=,
    $(eval $(foreach A_OPTION_NAME,$(subst $(COMMA), ,$(ULTRAMARINE)),  \
        $(call ULTRAMARINE_OPTION_PARSE,$(A_OPTION_NAME))))

    SHOW_ULTRAMARINE_OPTIONS = yes
endif

########
# convert Ultramarine-specific options (that represent combinations of standard options)
#   into QMK standard options.

ifneq ($(strip $(ULTRAMARINE_ROWS)), 4)
  ifneq ($(strip $(ULTRAMARINE_ROWS)), 5)
    $(error ULTRAMARINE_ROWS = $(strip $(ULTRAMARINE_ROWS)) is unexpected value)
  endif
endif
OPT_DEFS += -DULTRAMARINE_ROWS=$(strip $(ULTRAMARINE_ROWS))

ifeq ($(strip $(LED_BACK_ENABLE)), yes)
  RGBLIGHT_ENABLE = yes
  OPT_DEFS += -DRGBLED_BACK
  ifeq ($(strip $(LED_UNDERGLOW_ENABLE)), yes)
    $(error LED_BACK_ENABLE and LED_UNDERGLOW_ENABLE both 'yes')
  endif
else ifeq ($(strip $(LED_UNDERGLOW_ENABLE)), yes)
  RGBLIGHT_ENABLE = yes
endif

ifeq ($(strip $(IOS_DEVICE_ENABLE)), yes)
    OPT_DEFS += -DIOS_DEVICE_ENABLE
endif

ifeq ($(strip $(LED_ANIMATIONS)), yes)
    OPT_DEFS += -DLED_ANIMATIONS
endif

ifeq ($(strip $(OLED_ENABLE)), yes)
    OLED_DRIVER = SSD1306
    ifeq ($(strip $(LOCAL_GLCDFONT)), yes)
       OPT_DEFS += -DOLED_FONT_H=\<ultramarinefont.h\>
    else
       OPT_DEFS += -DOLED_FONT_H=\"common/glcdfont.c\"
    endif
endif

ifneq ($(strip $(SHOW_ULTRAMARINE_OPTIONS)),)
  $(info Ultramarine Spacific Build Options)
  $(info -  OLED_ENABLE          = $(OLED_ENABLE))
  $(info -  LED_BACK_ENABLE      = $(LED_BACK_ENABLE))
  $(info -  LED_UNDERGLOW_ENABLE = $(LED_UNDERGLOW_ENABLE))
  $(info -  LED_ANIMATIONS       = $(LED_ANIMATIONS))
  $(info -  IOS_DEVICE_ENABLE    = $(IOS_DEVICE_ENABLE))
  $(info )
  $(info QMK Build Options)
  $(info -- SPLIT_KEYBOARD     = $(SPLIT_KEYBOARD))
  $(info -- RGBLIGHT_ENABLE    = $(RGBLIGHT_ENABLE))
  $(info -- OLED_DRIVER        = $(OLED_DRIVER))
  $(info -- OLED_LOCAL_ENABLE  = $(OLED_LOCAL_ENABLE))
  $(info -- CONSOLE_ENABLE     = $(CONSOLE_ENABLE))
  $(info -- OPT_DEFS           = $(OPT_DEFS))
  $(info -- LTO_ENABLE         = $(LTO_ENABLE))
  $(info )
endif
