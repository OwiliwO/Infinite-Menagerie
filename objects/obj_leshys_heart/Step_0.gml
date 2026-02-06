/// @description Итерация


event_inherited();

if (is_owned && !is_owned_passive) {
	
	with (obj_character_main) {
		is_double_life = true;
	}
	
	is_owned_passive = true;
}

if (instance_exists(obj_character_main) && is_owned) {
	if (obj_character_main.statistic_HP <= 0) {
		obj_character_main.statistic_HP = obj_character_main.statistic_MAX_HP;
		obj_character_main.statistic_OLD_HP = obj_character_main.statistic_HP;
		
		obj_character_main.is_double_life = false;
		instance_destroy();
	}
}