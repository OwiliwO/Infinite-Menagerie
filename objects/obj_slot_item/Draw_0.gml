/// @description Визуализация


event_inherited();

var _old_font = draw_get_font();
var _old_color = draw_get_color();

draw_set_font(fnt_description);
draw_set_color(make_color_rgb(23, 10, 36));

if (slot_index == 0) draw_text_ext_transformed(x - 5 + hover_up, y + 3, obj_manager_controls.quick_cast_item_1, 100, 32, 1.3, 1.3, 0);
if (slot_index == 1) draw_text_ext_transformed(x - 5 + hover_up, y + 3, obj_manager_controls.quick_cast_item_2, 100, 32, 1.3, 1.3, 0);
if (slot_index == 2) draw_text_ext_transformed(x - 5 + hover_up, y + 3, obj_manager_controls.quick_cast_item_3, 100, 32, 1.3, 1.3, 0);
if (slot_index == 3) draw_text_ext_transformed(x - 5 + hover_up, y + 3, obj_manager_controls.quick_cast_item_4, 100, 32, 1.3, 1.3, 0);
if (slot_index == 4) draw_text_ext_transformed(x - 5 + hover_up, y + 3, obj_manager_controls.quick_cast_item_5, 100, 32, 1.3, 1.3, 0);
if (slot_index == 5) draw_text_ext_transformed(x - 5 + hover_up, y + 3, obj_manager_controls.quick_cast_item_6, 100, 32, 1.3, 1.3, 0);

draw_set_font(_old_font);
draw_set_color(_old_color);