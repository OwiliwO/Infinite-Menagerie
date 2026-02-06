/// @description Визуализация текста

var old_alpha = draw_get_alpha();
var old_color = draw_get_color();
var old_halign = draw_get_halign();
var old_valign = draw_get_valign();
var old_font = draw_get_font();

draw_set_alpha(alpha);
draw_set_color(color);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_naming);

var text_x = start_x + random_offset;
var text_y = y;

draw_set_color(make_color_rgb(0, 0, 0));
draw_set_alpha(alpha * 0.5);
if (damage_value != -1) draw_text_transformed(text_x + 2, text_y + 2, string(damage_value) + " " + text_value, scale, scale, 0);
else draw_text_transformed(text_x + 2, text_y + 2, text_value, scale, scale, 0);

draw_set_color(color);
draw_set_alpha(alpha);
if (damage_value != -1) draw_text_transformed(text_x, text_y, string(damage_value) + " " + text_value, scale, scale, 0);
else draw_text_transformed(text_x, text_y, text_value, scale, scale, 0);

draw_set_alpha(old_alpha);
draw_set_color(old_color);
draw_set_halign(old_halign);
draw_set_valign(old_valign);
draw_set_font(old_font);