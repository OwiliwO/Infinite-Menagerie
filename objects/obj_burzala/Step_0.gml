/// @description Итерация


event_inherited();

if (is_owned && !is_owned_passive) {
	with (obj_character_main) {
		statistic_INTELEGENCE += other.item_equipment_buff;
		percent_buff_crit += 50;
		alarm[0] = 1;
	}
	with (obj_manager_main) update_curse();
	
	is_owned_passive = true;
}
