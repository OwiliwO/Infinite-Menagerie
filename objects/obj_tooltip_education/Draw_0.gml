/// @description Подсказка о продолжении обучения


if ((step_of_eductation != 4 && step_of_eductation != 9 && step_of_eductation <= 10) || (obj_manager_main.current_wave + 1 == 4 && step_of_eductation_shop <= 2)) {
	var _old_font = draw_get_font();
	draw_set_font(fnt_description);
	draw_text_ext_transformed_color(obj_character_main.x + obj_character_main.sprite_width / 2 - 130, 
									obj_character_main.y + obj_character_main.sprite_height, 
									desc_continue, 
									40, 500, 1.5, 1.5, 0, make_color_rgb(23, 10, 36), 
									make_color_rgb(23, 10, 36),
									make_color_rgb(23, 10, 36), 
									make_color_rgb(23, 10, 36), 1);
	draw_set_font(_old_font);
}