#include QMK_KEYBOARD_H

enum layer_number {
    _DEFAULT = 0,
    _FUNC0,
    _FUNC1,
    _FUNC2,
    _FUNC01,
    _FUNC02,
    _FUNC12,
    _OPTION
};

enum custom_keycodes
{
    RE_CCW = SAFE_RANGE,
    RE_CW,
    FUNC0,
    FUNC1,
    FUNC2,
    OPTION
};

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    [_DEFAULT] = LAYOUT(
/*                             Reset*/  FUNC2,
/*        .---------------------------------.
   .------|          |           |          |
   |     */  KC_A,     KC_B,     KC_C, /*
   '------|          |           |          |
          '---------------------------------'*/
                                FUNC0,  FUNC1
    ),

    [_FUNC1] = LAYOUT(
/*                             Reset*/  FUNC2,
/*        .---------------------------------.
   .------|          |           |          |
   |     */  KC_TAB,    KC_ESC,     KC_ENT, /*
   '------|          |           |          |
          '---------------------------------'*/
                                FUNC0,  FUNC1
    ),

    [_FUNC2] = LAYOUT(
/*                             Reset*/  FUNC2,
/*        .---------------------------------.
   .------|          |           |          |
   |     */  KC_TAB,    KC_ESC,     KC_ENT, /*
   '------|          |           |          |
          '---------------------------------'*/
                                FUNC0,  FUNC1
    ),

    [_OPTION] = LAYOUT(
/*                             Reset*/  FUNC2,
/*        .---------------------------------.
   .------|          |           |          |
   |     */  KC_TAB,    KC_ESC,     KC_ENT, /*
   '------|          |           |          |
          '---------------------------------'*/
                                FUNC0,  FUNC1
    ),
};

void persistent_default_layer_set(uint16_t default_layer) {
  eeconfig_update_default_layer(default_layer);
  default_layer_set(default_layer);
}

// void update_tri_layer(uint8_t layer1, uint8_t layer2, uint8_t layer3) {
//   if (IS_LAYER_ON(layer1) && IS_LAYER_ON(layer2)) {
//     #ifdef RGBLIGHT_ENABLE
//       //rgblight_mode(RGB_current_mode);
//     #endif
//     layer_on(layer3);
//   } else {
//     layer_off(layer3);
//   }
// }

int re_phase = 0; // encoder's phase
bool encoder_update_user(uint8_t index, bool clockwise) {
    if (index == 0) { /* First encoder */
        if (clockwise) {
          // script when encoder turn clockwise 
            tap_code(KC_R);
            re_phase++;
            if (re_phase >= 24)
            {
              re_phase = 0;
            }
        } else {
          // script when encoder turn counterclockwise 
            tap_code(KC_L);
            re_phase++;
            if (re_phase <= 0)
            {
              re_phase = 23;
            }
        }
    } //else if (index == 1) { /* Second encoder */
    //     if (clockwise) {
    //         rgb_matrix_increase_hue();
    //     } else {
    //         rgb_matrix_decrease_hue();
    //     }
    // }
    return false;
}

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
  switch (keycode) {
    case FUNC1:
      if (record->event.pressed) {
        layer_on(_FUNC1);
        update_tri_layer(_FUNC1, _FUNC2, _OPTION);
      } else {
        layer_off(_FUNC1);
        update_tri_layer(_FUNC1, _FUNC2, _OPTION);
      }
      return false;
      break;
    case FUNC2:
      if (record->event.pressed) {
        layer_on(_FUNC2);
        update_tri_layer(_FUNC1, _FUNC2, _OPTION);
      } else {
        layer_off(_FUNC2);
        update_tri_layer(_FUNC1, _FUNC2, _OPTION);
      }
      return false;
      break;
  }
  return true;
}