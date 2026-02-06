/// @description Визуализация статистики


if (show_stats && array_length(games) > 0) {
	var window_width = 1000;
    var window_height = 700;
    var window_x = (display_get_gui_width() - window_width) / 2;
    var window_y = (display_get_gui_height() - window_height) / 2;
    
    stats_window_bounds = [window_x, window_y, window_x + window_width, window_y + window_height];
    
    draw_set_alpha(0.7);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    
    draw_set_color(make_color_rgb(23, 10, 36));
    draw_rectangle(window_x, window_y, window_x + window_width, window_y + window_height, false);
    
	draw_set_alpha(1);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
	
	draw_set_font(fnt_description);
    draw_text_ext_transformed(window_x + window_width - 170, (window_y + 40), get_translate(global.translate_grid, "desc_continue"), 20, 150, 2, 2, 0);
	draw_text_ext_transformed(window_x + window_width - 170, (window_y + 120), get_translate(global.translate_grid, "desc_drop"), 20, 150, 2, 2, 0);
   
    var current_game = games[current_game_index];
    
    var y_offset = window_y + 60;
    var line_height = 65;
	var desc_line = 20;
    
	draw_set_font(fnt_naming);
    draw_text_ext_transformed(window_x + window_width / 2, y_offset, "Canvas of Glory", 20, 150, 2.5, 2.5, 0);
    y_offset += line_height * 1.5;
    
    draw_text_ext_transformed(window_x + 150, y_offset, string(date_get_year(current_game[0])) + "." + string(date_get_month(current_game[0])) + "." + string(date_get_day(current_game[0])) + " " + string(date_get_hour(current_game[0])) + ":" + string(date_get_minute(current_game[0])) + ":" + string(date_get_second(current_game[0])), 20, 150, 1.5, 1.5, 0);
    y_offset += line_height;
    
	draw_set_halign(fa_left);
	draw_set_font(fnt_description);
	
	if (current_game[1])  draw_text_ext_transformed_color(window_x + window_width / 4, y_offset - 40, get_translate(global.translate_grid, "stat_target_yes"), 20, 150, 2, 2, 0, c_green, c_green, c_green, c_green, 1);
	if (!current_game[1]) draw_text_ext_transformed_color(window_x + window_width / 4, y_offset - 40, get_translate(global.translate_grid, "stat_target_no"), 20, 150, 2, 2, 0, c_red, c_red, c_red, c_red, 1);
	
    draw_text_ext_transformed(window_x + window_width / 4, y_offset, get_translate(global.translate_grid, "stat_count_waves") + string(current_game[2]), 20, 150, 2, 2, 0);
    
	if (array_length(current_game[10]) > 0) {
		draw_text_ext_transformed(window_x + window_width / 2, y_offset, get_translate(global.translate_grid, "stat_inventory"), 20, 150, 2, 2, 0);
		draw_set_font(fnt_naming);
		var start_x = window_x + window_width - 320;
		var start_y = y_offset + 20;
		var line_height = 60;
		for (var i = 0; i < array_length(current_game[10]); i++) {
	        var current_y = start_y + (i * line_height);
			draw_text_ext_transformed_color(start_x, current_y, 
				current_game[10][i], 
				40, 500, 1.5, 1.5, 0, c_white, c_white, c_white, c_white,
				1);
	    }
	}
	
	y_offset += line_height - desc_line;
    
	draw_set_font(fnt_description);
    draw_text_ext_transformed(window_x + window_width / 4, y_offset, get_translate(global.translate_grid, "stat_max_HP") + string(current_game[3]), 20, 150, 2, 2, 0);
    y_offset += line_height - desc_line;
    
    draw_text_ext_transformed(window_x + window_width / 4, y_offset, get_translate(global.translate_grid, "stat_max_MP") + string(current_game[4]), 20, 150, 2, 2, 0);
    y_offset += line_height - desc_line;
    
    draw_text_ext_transformed(window_x + window_width / 4, y_offset, get_translate(global.translate_grid, "stat_max_AP") + string(current_game[5]), 20, 150, 2, 2, 0);
    y_offset += line_height - desc_line;
    
	var _main_attribute = "";
	if (current_game[6] == 0) _main_attribute = get_translate(global.translate_grid, "stat_main_attribute_Strength");
	if (current_game[6] == 1) _main_attribute = get_translate(global.translate_grid, "stat_main_attribute_Agility");
	if (current_game[6] == 2) _main_attribute = get_translate(global.translate_grid, "stat_main_attribute_Intelligence");
    draw_text_ext_transformed(window_x + window_width / 4, y_offset, _main_attribute, 20, 250, 2, 2, 0);
    y_offset += line_height - desc_line;
    
    draw_text_ext_transformed(window_x + window_width / 4, y_offset, get_translate(global.translate_grid, "stat_statistic_Strength") + string(current_game[7]), 20, 150, 2, 2, 0);
    y_offset += line_height - desc_line;
    
    draw_text_ext_transformed(window_x + window_width / 4, y_offset, get_translate(global.translate_grid, "stat_statistic_Agility") + string(current_game[8]), 20, 150, 2, 2, 0);
    y_offset += line_height - desc_line;
    
    draw_text_ext_transformed(window_x + window_width / 4, y_offset, get_translate(global.translate_grid, "stat_statistic_Intelligence") + string(current_game[9]), 20, 150, 2, 2, 0);
    if (array_length(current_game[10]) > 0) y_offset += line_height + desc_line * 4.5;
	else y_offset += line_height + desc_line * 2.5;
    
	draw_set_halign(fa_center);
    draw_text_ext_transformed(window_x + window_width / 2, y_offset, string(current_game_index + 1) + " / " + string(array_length(games)), 20, 150, 2, 2, 0);
    
    var btn_width = 120;
    var btn_height = 40;
    var btn_y = window_y + window_height - 80;
    
    var prev_btn_x = window_x + 50;
    if (current_game_index > 0) {
        draw_sprite(spr_ui_arrow, 0, prev_btn_x + btn_width/2, btn_y + btn_height/2);
    } else {
        draw_sprite_ext(spr_ui_arrow, 0, prev_btn_x + btn_width/2, btn_y + btn_height/2, 1, 1, 0, c_gray, 0.5);
    }

    var next_btn_x = window_x + window_width - btn_width - 50;
    if (current_game_index < array_length(games) - 1) {
        draw_sprite(spr_ui_arrow, 1, next_btn_x + btn_width/2, btn_y + btn_height/2);
    } else {
        draw_sprite_ext(spr_ui_arrow, 1, next_btn_x + btn_width/2, btn_y + btn_height/2, 1, 1, 0, c_gray, 0.5);
    }
	
    draw_set_halign(fa_left);
}