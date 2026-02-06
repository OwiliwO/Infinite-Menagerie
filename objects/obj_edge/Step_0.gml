/// @description Итерация


event_inherited();

if (instance_exists(obj_character_main)) {
	if (item_current_AP > obj_character_main.statistic_MAX_AP) is_owned_passive = false;

	if (is_owned && !is_owned_passive) {
		item_current_AP = obj_character_main.statistic_MAX_AP;
		var _add_damage = round(item_current_AP / 4);
		obj_character_main.add_damage += _add_damage;
	
		is_owned_passive = true;
	}
}