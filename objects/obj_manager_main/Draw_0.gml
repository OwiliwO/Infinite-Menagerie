/// @description Визуализация


var _old_font = draw_get_font();
var _old_halign = draw_get_halign();
draw_set_font(fnt_naming);
draw_set_halign(fa_center);
if (instance_exists(obj_manager_wave)) {
	if (obj_manager_wave.total_chosen_struct != 0) {
		if (obj_manager_wave.total_chosen_struct == 20 || obj_manager_wave.total_chosen_struct == 21 || obj_manager_wave.total_chosen_struct == 22) {
			draw_sprite_ext(spr_portreits_bosses,
				obj_manager_wave.total_chosen_struct - 20,
				room_width / 8,
				100,
				1.5,
				1.5,
				0,
				c_white,
				blend_alpha);
		} else {
			draw_text_ext_transformed_color(
				room_width / 2, 
				100, 
				"Wave " + string(current_wave + 1), 
				40, 
				100, 
				2.5, 
				2.5, 
				0, 
				c_black,
				c_black,
				c_black,
				c_black,
				blend_alpha)
		}
	} else {
		draw_text_ext_transformed_color(
			room_width / 2, 
			100, 
			"Secret Shop", 
			40, 
			200, 
			2.5, 
			2.5, 
			0, 
			c_black,
			c_black,
			c_black,
			c_black,
			blend_alpha)
	}
}
draw_set_font(_old_font);
draw_set_halign(_old_halign);