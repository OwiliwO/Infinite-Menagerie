/// @description Итерация


event_inherited();

if (is_owned && !is_owned_passive) {
	
	with (obj_character_main) {
		statistic_STRENGTH += other.item_equipment_buff;
		alarm[0] = 1;
	}
	
	is_owned_passive = true;
}
