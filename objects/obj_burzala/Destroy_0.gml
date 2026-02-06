/// @description Реиницилизация


event_inherited();
if (is_owned) {
	with (obj_character_main) {
		statistic_INTELEGENCE -= other.item_equipment_buff;
		percent_buff_crit -= 50;
		alarm[0] = 1;
	}
	with (obj_manager_main) update_curse(true);
}
