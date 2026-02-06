/// @description Визуализация


var _old_alpha  = draw_get_alpha();
var _old_font   = draw_get_font();
var _old_halign = draw_get_halign();
var _old_valign = draw_get_valign();

draw_set_alpha(blend_alpha_dead);
draw_set_font(fnt_naming);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text_ext_transformed_color(
	room_width / 6, 
	400, 
	dead_text, 
	40, 
	500, 
	4, 
	4,
	0,
	make_color_rgb(23, 10, 36),
	make_color_rgb(23, 10, 36),
	make_color_rgb(23, 10, 36),
	make_color_rgb(23, 10, 36),
	blend_alpha_dead);
draw_set_font(fnt_description);
draw_text_ext_transformed_color(
	room_width / 1.5, 
	600, 
	dead_phrase, 
	40, 
	300, 
	3, 
	3, 
	0,
	make_color_rgb(23, 10, 36),
	make_color_rgb(23, 10, 36),
	make_color_rgb(23, 10, 36),
	make_color_rgb(23, 10, 36),
	blend_alpha_dead);
draw_text_ext_transformed_color(
	room_width, 
	1000, 
	get_translate(global.translate_grid, "desc_continue"), 
	40, 
	500, 
	4, 
	4, 
	0,
	make_color_rgb(23, 10, 36),
	make_color_rgb(23, 10, 36),
	make_color_rgb(23, 10, 36),
	make_color_rgb(23, 10, 36),
	blend_alpha_dead);

draw_set_alpha(_old_alpha);
draw_set_font(_old_font);
draw_set_halign(_old_halign);
draw_set_valign(_old_valign);