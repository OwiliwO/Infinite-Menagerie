/// @description Реиницилизация


event_inherited();
if (is_owned) {
	with (obj_character_main) {
		if (statistic_MAIN_ATTRIBUTE == "STRENGTH") statistic_STRENGTH -= 8;
		if (statistic_MAIN_ATTRIBUTE == "AGILITY") statistic_AGILITY -= 8;
		if (statistic_MAIN_ATTRIBUTE == "INTELEGENCE") statistic_INTELEGENCE -= 8;
		
		is_ability_mask = true;
		alarm[0] = 1;
	}
	with (obj_manager_main) update_curse(true);
}