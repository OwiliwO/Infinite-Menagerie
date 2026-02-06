/// @description Итерация


event_inherited();

if (is_owned && !is_owned_passive) {
	with (obj_parent_items) {
		if (is_owned) {
			if (variable_instance_exists(id, "item_equipment_buff")) {
				item_ritual = true;
				is_owned_passive = false;
			}
		}
	}
	
	is_owned_passive = true;
}

if (instance_exists(obj_manager_main)) {
	if (obj_manager_main.current_wave == global.CountWaves && !obj_manager_main.is_create_enemies && instance_exists(obj_character_main)) {
		item_count_exist--;
	}
}

if (item_count_exist <= 0) {
	with (obj_parent_items) {
		if (is_owned) {
			if (variable_instance_exists(id, "item_equipment_buff")) {
				item_equipment_buff *= 2;
				instance_destroy();
			}
		}
	}
	
	instance_destroy();
}