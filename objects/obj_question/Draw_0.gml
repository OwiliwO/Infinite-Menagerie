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

draw_sprite_ext(
	sprite_index, 
	image_index + 1, 
	drawing_x, 
	drawing_y, 
	1, 
	1, 
	0, 
	image_blend, 
	blend_alpha);