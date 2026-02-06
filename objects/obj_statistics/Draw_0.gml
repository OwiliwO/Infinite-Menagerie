/// @description Визуализация


event_inherited();

var _old_halign = draw_get_halign();
var _old_font = draw_get_font();
var _old_color = draw_get_color();
var _position_x = drawing_x + sprite_width / 2 + hover_up;
var _position_y = drawing_y + sprite_height;

draw_set_halign(fa_center);
draw_set_font(fnt_naming);
if (image_index == 0) {
	draw_set_color(make_color_rgb(159, 56, 56));
	draw_text(_position_x, _position_y, string(obj_character_main.statistic_STRENGTH));
}
if (image_index == 1) {
	draw_set_color(make_color_rgb(122, 174, 77));
	draw_text(_position_x, _position_y, string(obj_character_main.statistic_AGILITY));
}
if (image_index == 2) {
	draw_set_color(make_color_rgb(99, 182, 195));
	draw_text(_position_x, _position_y, string(obj_character_main.statistic_INTELEGENCE));
}

draw_set_halign(_old_halign);
draw_set_font(_old_font);
draw_set_color(_old_color);
