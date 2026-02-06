/// @description Реиницилизация


event_inherited();
if (is_owned) {
	with (obj_character_main) {
		is_buff_splash = false;
		alarm[0] = 1;
	}
}