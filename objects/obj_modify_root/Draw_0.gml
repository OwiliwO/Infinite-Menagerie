/// @description Визуализация


if (instance_exists(modify_id)) {
	draw_sprite(spr_particle_roots, image_index_root, 
				modify_id.drawing_x - 5, 
				modify_id.drawing_y + 4);
}
