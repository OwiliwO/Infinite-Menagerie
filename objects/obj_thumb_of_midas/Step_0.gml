/// @description Итерация


event_inherited();

if (instance_exists(obj_manager_main)) {
	if (is_owned && !is_owned_passive) {
		obj_manager_main.current_reward += item_add_gold;
		is_owned_passive = true;
	}

	if (obj_manager_main.current_wave == global.CountWaves && !obj_manager_main.is_create_enemies) is_owned_passive = false;
}