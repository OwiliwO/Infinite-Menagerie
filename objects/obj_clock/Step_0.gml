/// @description Смена хода


event_inherited();

var _is_side = ""
if (global.SlideSide) _is_side = get_translate(global.translate_grid, "desc_is_not_side_own") 
else _is_side = get_translate(global.translate_grid, "desc_is_side_own");
text_description = get_translate(global.translate_grid, "desc_slide_side_1") + _is_side + get_translate(global.translate_grid, "desc_slide_side_2") + string(obj_manager_main.current_wave + 1);

if (!global.SlideSide) {
	image_speed = 1;
	
	if (image_index == 0) { image_speed = 0; image_index = 0; }
}
if (global.SlideSide) {
	image_speed = 1;
	
	if (image_index >= 2) { image_speed = 0; image_index = 2; }
}