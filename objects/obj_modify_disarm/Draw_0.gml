/// @description Визуализация


if (instance_exists(modify_id)) {
	draw_sprite(spr_particle_stats, 0, 
				modify_id.drawing_x + modify_id.sprite_width / 4 + 1, 
				modify_id.drawing_y + modify_id.sprite_height / 4);
}
