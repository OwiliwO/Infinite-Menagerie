/// @description Реиницилизация


event_inherited();
if (is_owned) {
	with (obj_character_main) {
		statistic_STRENGTH -= 3;
		is_buff_immortality = false;
		percent_buff_immortality = 25;
		alarm[0] = 1;
	}
	with (obj_manager_main) update_curse(true);
}
