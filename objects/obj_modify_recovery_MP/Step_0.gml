/// @description Итерация


if (modify_count <= 0) instance_destroy();
if (instance_exists(modify_id)) {
	if (is_recovery) {
		if (modify_count > 1) src_clue(modify_id, -1, "Recovery MP", c_aqua);
		if (modify_id.statistic_MP <= modify_id.statistic_MAX_MP) modify_id.statistic_MP += modify_recovery;
		modify_count--;
		is_recovery = false;
	}
	if (modify_id.statistic_MP > modify_id.statistic_MAX_MP) modify_id.statistic_MP = modify_id.statistic_MAX_MP;
}