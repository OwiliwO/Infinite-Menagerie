/// @description Итерация


event_inherited();

if (instance_exists(obj_manager_main) && instance_exists(obj_character_main)) {
	if (obj_manager_main.current_wave == global.CountWaves && !obj_manager_main.is_create_enemies) {
		var _add_MP = round(obj_character_main.statistic_MAX_MP / 4);
		if (obj_character_main.statistic_MP <= obj_character_main.statistic_MAX_MP - _add_MP) {
			src_clue(obj_character_main.id, _add_MP, global.DescMP, c_aqua);
			obj_character_main.statistic_MP += _add_MP;
		}
	}
}