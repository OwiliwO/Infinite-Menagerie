/// @description Визуализация


event_inherited();

var _old_valign = draw_get_valign();
var _old_font = draw_get_font();
var _old_color = draw_get_color();
var _old_alpha = draw_get_alpha();
var _position_x = drawing_x + sprite_width + hover_up;
var _position_y = drawing_y + sprite_height / 2;

draw_set_valign(fa_middle);
draw_set_font(fnt_naming);
draw_set_alpha(1);
draw_text(_position_x, _position_y, string(global.PlayerGoldCount));

draw_set_valign(_old_valign);
draw_set_font(_old_font);
draw_set_color(_old_color);
draw_set_alpha(_old_alpha);