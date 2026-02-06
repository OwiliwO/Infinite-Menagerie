/// @description Итерация


event_inherited();

if (is_owned && !is_owned_passive) {
	with (obj_character_main) {		
		if (statistic_MAIN_ATTRIBUTE == "STRENGTH") statistic_STRENGTH += 8;
		if (statistic_MAIN_ATTRIBUTE == "AGILITY") statistic_AGILITY += 8;
		if (statistic_MAIN_ATTRIBUTE == "INTELEGENCE") statistic_INTELEGENCE += 8;
		is_ability_mask = false;
		
		alarm[0] = 1;
	}
	with (obj_manager_main) update_curse();
	
	is_owned_passive = true;
}