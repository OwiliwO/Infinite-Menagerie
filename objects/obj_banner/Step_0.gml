/// @description Итерация


event_inherited();

text_description = get_translate(global.translate_grid, "desc_achivements");

if (obj_manager_main_menu.max_count_waves < 12) image_index = 0;
if (obj_manager_main_menu.max_count_waves >= 12 && obj_manager_main_menu.max_count_waves < 24) image_index = 1;
if (obj_manager_main_menu.max_count_waves >= 24 && obj_manager_main_menu.max_count_waves < 36) image_index = 2;
if (obj_manager_main_menu.max_count_waves >= 36 && obj_manager_main_menu.max_count_waves < 48) image_index = 3;
if (obj_manager_main_menu.max_count_waves >= 48 && obj_manager_main_menu.max_count_waves < 60) image_index = 4;
if (obj_manager_main_menu.max_count_waves >= 72) image_index = 5;

if (instance_exists(obj_tooltip_statistic)) {
	if (obj_tooltip_statistic.show_stats) {
		if (mouse_check_button_pressed(mb_left)) {
			var mx = mouse_x;
	        var my = mouse_y;
        
	        if (point_in_rectangle(mx, my, 510 / 2, 810 / 2, 630 / 2, 870 / 2)) {
				obj_tooltip_statistic.current_game_index = max(0, obj_tooltip_statistic.current_game_index - 1);
	        }
	        if (point_in_rectangle(mx, my, 1290 / 2, 810 / 2, 1410 / 2, 870 / 2)) {
				obj_tooltip_statistic.current_game_index = min(array_length(obj_tooltip_statistic.games) - 1, obj_tooltip_statistic.current_game_index + 1);
	        }
	    }
    
	    if (keyboard_check_pressed(vk_escape)) {
	        audio_play_sound(snd_choose_keyboard, 100, 0);
			obj_tooltip_statistic.show_stats = false;
	    }
		
		if (keyboard_check_pressed(ord("F"))) {
			audio_play_sound(snd_choose_keyboard, 100, 0);
			global.StaticticGames = [];
			obj_manager_main_menu.max_count_waves = 0;
			if (file_exists("InfiniteMenagerieStatisticGamesavedate.sav")) {
				file_delete("InfiniteMenagerieStatisticGamesavedate.sav");
			}
		}
	}
}
