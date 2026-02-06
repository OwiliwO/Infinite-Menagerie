/// @description Итерация


if (modify_count <= 0) instance_destroy();
if (instance_exists(modify_id)) {
	if (is_recovery) {
		if (modify_count > 1) src_clue(modify_id, -1, "Recovery HP", c_red);
		if (modify_id.statistic_HP <= modify_id.statistic_MAX_HP) modify_id.statistic_HP += modify_recovery;
		modify_count--;
		is_recovery = false;
	}
	if (modify_id.statistic_HP > modify_id.statistic_MAX_HP) modify_id.statistic_HP = modify_id.statistic_MAX_HP;
	modify_id.statistic_OLD_HP = modify_id.statistic_HP;
}