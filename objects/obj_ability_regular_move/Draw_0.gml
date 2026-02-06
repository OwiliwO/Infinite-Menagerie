/// @description Визуализация


event_inherited();

var _old_font = draw_get_font();

draw_set_font(fnt_description);
draw_text_ext_transformed(x + 6.5 + hover_up, y + 3, obj_manager_controls.quick_cast_ability_2, 100, 32, 1.3, 1.3, 0);
draw_set_font(_old_font);