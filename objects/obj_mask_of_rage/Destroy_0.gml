/// @description Реиницилизация


event_inherited();
if (is_owned) {
	with (obj_character_main) {
		statistic_INTELEGENCE += 2;
		alarm[0] = 1;
	}
	with (obj_manager_main) update_curse();
}
