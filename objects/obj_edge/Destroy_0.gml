/// @description Реиницилизация


event_inherited();
if (instance_exists(obj_character_main) && is_owned) {
	var _add_damage = round(item_current_AP / 4);
		
	obj_character_main.add_damage -= _add_damage;
}