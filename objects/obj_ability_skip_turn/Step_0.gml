/// @description Использование способности


event_inherited();
if (obj_character_main.is_active_turn) visible = true; else visible = false;

if ((mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id) || (keyboard_check_pressed(ord(obj_manager_controls.quick_cast_ability_4)))) && visible) {
	if (keyboard_check_pressed(ord(obj_manager_controls.quick_cast_ability_4))) audio_play_sound(snd_choose_keyboard, 100, 0);
	else audio_play_sound(snd_choose_mouse, 100, 0);
	if (!obj_character_main.is_moving && !obj_character_main.is_attacking) {
		if (instance_exists(obj_parent_characters_enemies) && obj_character_main.is_buff_teleport_turn) {
			with (obj_parent_characters_enemies) {
				instance_destroy();
			}
		}
		
		global.TypeAbility = "Skip_Turn";
		sprite_index = spr_ui_ability_main_active;
		alarm[0] = 10;
	}
}
