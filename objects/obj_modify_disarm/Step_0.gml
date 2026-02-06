/// @description Итерация


if (modify_count <= 0) instance_destroy();
if (instance_exists(modify_id)) {
	if (is_recovery) {
		if (modify_count > 1) src_clue(modify_id, -1, "Disarm", c_red);
		modify_id.is_debuff_disarm = true;
		modify_count--;
		is_recovery = false;
	}
} else instance_destroy();