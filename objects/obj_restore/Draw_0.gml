/// @description Визуализация


event_inherited();

var _old_font = draw_get_font();
draw_set_font(fnt_naming);
draw_text_ext_color(x + sprite_width / 4, y - 30, restore_cost, 40, 40, c_yellow, c_yellow, c_yellow, c_yellow, 1);

draw_set_font(_old_font);