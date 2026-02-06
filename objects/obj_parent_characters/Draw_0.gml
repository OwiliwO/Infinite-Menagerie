/// @description Визуализация


draw_sprite_ext(
    sprite_index, 
    image_index, 
    drawing_x, 
    drawing_y, 
    1, 
    1, 
    0, 
    image_blend, 
    image_alpha
);

if (is_buff_immortality) {
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(sprite_index, image_index, drawing_x, drawing_y, 1, 1, 0, c_yellow, 0.5);
	gpu_set_blendmode(bm_normal);
}

if (is_buff_rage) {
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(sprite_index, image_index, drawing_x, drawing_y, 1, 1, 0, c_red, 0.5);
	gpu_set_blendmode(bm_normal);
}

if (is_blend) {
	draw_sprite_ext(
	sprite_index, 
	3, 
	drawing_x, 
	drawing_y, 
	1, 
	1, 
	0, 
	image_blend, 
	blend_alpha);
}

if (is_shaking) {
    drawing_x += shake_offset_x;
    drawing_y += shake_offset_y;
}