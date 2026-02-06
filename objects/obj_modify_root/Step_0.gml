/// @description Итерация


if (modify_count <= 0) instance_destroy();
if (image_index_root <= 4) image_index_root += 0.1;
if (instance_exists(modify_id)) {
	if (is_recovery) {
		if (modify_count > 1) src_clue(modify_id, -1, "Root", c_red);
		modify_id.is_debuff_root = true;
		modify_count--;
		is_recovery = false;
	}
} else instance_destroy();