/// @description Использование способности


event_inherited();
if (obj_character_main.is_active_turn) visible = true; else visible = false;

text_description = get_translate(global.translate_grid, "desc_ability_attack") + string(obj_character_main.statistic_DAMAGE);

if ((mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id) || (keyboard_check_pressed(ord(obj_manager_controls.quick_cast_ability_1)))) && visible) {
	if (keyboard_check_pressed(ord(obj_manager_controls.quick_cast_ability_1))) audio_play_sound(snd_choose_keyboard, 100, 0);
	else audio_play_sound(snd_choose_mouse, 100, 0);
	if (!obj_character_main.is_moving && !obj_character_main.is_attacking) {
		global.TypeAbility = "Regular_Attack";
		with (obj_claymore) {
			if (is_owned) { global.TypeAbility = "Regular_Attack_Four_Direction"; break; }
		}
		with (obj_aglegor) {
			if (is_owned) { global.TypeAbility = "Regular_Attack_Eight_Direction"; break; }
		}
		sprite_index = spr_ui_ability_main_active;
	}
}

if (mouse_check_button_pressed(mb_right) || global.TypeAbility != "Regular_Attack" && visible) {
	sprite_index = spr_ui_ability_main;
}