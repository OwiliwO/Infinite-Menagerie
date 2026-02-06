/// @description Использование способности


event_inherited();
if (obj_character_main.is_active_turn) visible = true; else visible = false;

text_description = get_translate(global.translate_grid, "desc_ability_move") + string(obj_character_main.statistic_SPEED);

if ((mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id) || (keyboard_check_pressed(ord(obj_manager_controls.quick_cast_ability_2)))) && visible) {
	if (keyboard_check_pressed(ord(obj_manager_controls.quick_cast_ability_2))) audio_play_sound(snd_choose_keyboard, 100, 0);
	else audio_play_sound(snd_choose_mouse, 100, 0);
	if (!obj_character_main.is_moving && !obj_character_main.is_attacking) {
		global.TypeAbility = "Regular_Move";
		sprite_index = spr_ui_ability_main_active;
	}
}

if (mouse_check_button_pressed(mb_right) || global.TypeAbility != "Regular_Move" && visible) {
	sprite_index = spr_ui_ability_main;
}