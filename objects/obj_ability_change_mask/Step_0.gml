/// @description Использование способности


event_inherited();
if (obj_character_main.is_active_turn) visible = true; else visible = false;

if ((mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id) || (keyboard_check_pressed(ord(obj_manager_controls.quick_cast_ability_3)))) && visible) {
	if (keyboard_check_pressed(ord(obj_manager_controls.quick_cast_ability_3))) audio_play_sound(snd_choose_keyboard, 100, 0);
	else audio_play_sound(snd_choose_mouse, 100, 0);
	if (!obj_character_main.is_moving && !obj_character_main.is_attacking) {
		global.TypeAbility = "Change_Mask";
		sprite_index = spr_ui_ability_additional_active;
	}
}

if (mouse_check_button_pressed(mb_right) || global.TypeAbility != "Change_Mask" && visible) {
	sprite_index = spr_ui_ability_additional;
}