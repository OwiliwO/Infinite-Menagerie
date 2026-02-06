/// @description Реинициализация


if (instance_exists(obj_mask_of_rage)) {
	with (obj_mask_of_rage) {
		if (is_owned) sprite_index = spr_ui_items_thing;
	}
}

if (instance_exists(modify_id)) {
	modify_id.is_buff_rage = false;
	modify_id.statistic_AGILITY = modify_id.statistic_AGILITY div modify_AP;
	with (modify_id) alarm[0] = 1;
}
src_clue(modify_id, -1, "Rage End", c_red);