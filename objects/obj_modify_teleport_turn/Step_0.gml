/// @description Итерация


if (modify_count <= 0) instance_destroy();
if (instance_exists(modify_id)) {
	obj_character_main.is_buff_teleport_turn = true;
	if (modify_id.statistic_AP <= 0) {
		if (modify_count > 1) src_clue(modify_id, -1, "Teleport", c_purple);
		modify_count--;
	}
}