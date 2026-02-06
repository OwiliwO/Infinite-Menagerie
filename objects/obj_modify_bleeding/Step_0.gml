/// @description Итерация


if (modify_count <= 0) instance_destroy();
if (instance_exists(modify_id)) {
	if (is_recovery) {
		if (modify_count > 1) src_clue(modify_id, -1, "Bleeding", c_red);
		if (modify_id.statistic_HP > 2) modify_id.statistic_HP -= 2;
		modify_count--;
		is_recovery = false;
	}
} else instance_destroy();