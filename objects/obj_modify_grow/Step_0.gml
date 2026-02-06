/// @description Итерация


if (modify_count <= 0 && modify_target_grow != noone && modify_id != noone && !global.SlideSide) {
	if (instance_exists(modify_id)) {
		var enemy = instance_create_layer(0, 0, "Characters", modify_target_grow);
		enemy.grid_x = modify_id.grid_x;
		enemy.grid_y = modify_id.grid_y;
		enemy.target_x = obj_manager_map.grid_offset_x + enemy.grid_x * obj_manager_map.cell_size + 10;
		enemy.target_y = obj_manager_map.grid_offset_y + enemy.grid_y * obj_manager_map.cell_size - 16;
		enemy.x = enemy.target_x;
		enemy.y = enemy.target_y;
		enemy.is_have_fallen = true;
		enemy.idle_transition_progress = 1;
		src_clue(modify_id, -1, "Growing", c_red);
	
		instance_destroy();
		with (modify_id) { obj_manager_wave.total_count_enemies++; instance_destroy(); }
	}
}
if (instance_exists(modify_id)) {
	if (modify_id.statistic_AP <= 0) modify_count--;
}