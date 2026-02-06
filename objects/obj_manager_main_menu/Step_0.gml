/// @description Итерация


current_logo_y = lerp(current_logo_y, logo_target_y, logo_speed);
if (array_length(global.StaticticGames) != 0) max_count_waves = find_max_stats()[1];

if (point_in_rectangle(mouse_x, mouse_y, 
					   room_width/2 - button_width[0]/2, 
					   button_current_y[0] - button_height/2, 
					   room_width/2 + button_width[0]/2, 
					   button_current_y[0] + button_height/2)) {
	if (!global.FirstPlayCheck) clue_change_attribute = true;
} else {
	clue_change_attribute = false;
}

switch (state) {
    case menu_state.main:
        for (var i = 0; i < 3; i++) {
            button_current_y[i] = lerp(button_current_y[i], button_target_y[i], button_speed);
        }
        
        for (var i = 0; i < 3; i++) {
            var bx = room_width/2;
            var by = button_current_y[i];
            var left = bx - button_width[i]/2;
            var right = bx + button_width[i]/2;
            var top = by - button_height/2;
            var bottom = by + button_height/2;
            
            var was_hovered = button_hover[i];
            button_hover[i] = point_in_rectangle(mouse_x, mouse_y, left, top, right, bottom);
            
            var target_scale = button_hover[i] ? hover_scale : 1.0;
            button_scale[i] = lerp(button_scale[i], target_scale, scale_speed);
        }
		
		settings_x = room_width;
		
        if (mouse_check_button_pressed(mb_left)) {
            for (var i = 0; i < 3; i++) {
                var bx = room_width/2;
                var by = button_current_y[i];
                var left = bx - button_width[i]/2;
                var right = bx + button_width[i]/2;
                var top = by - button_height/2;
                var bottom = by + button_height/2;
                
                if (point_in_rectangle(mouse_x, mouse_y, left, top, right, bottom)) {
                    if (i == 0) { // "Начать игру"
						audio_play_sound(snd_choose_mouse, 100, 0);
						state = menu_state.transition_to_game;
                        for (var j = 0; j < 3; j++) {
                            button_target_y[j] = button_current_y[j] + 300;
                        }
						settings_target_x = 0;
						obj_manager_controls.is_transition_start = false;
						alarm[0] = 60;
                    }
                    if (i == 1) { // "Настройки"
						audio_play_sound(snd_choose_mouse, 100, 0);
						state = menu_state.transition_to_settings;
                        for (var j = 0; j < 3; j++) {
                            button_target_y[j] = button_current_y[j] + 300;
                        }
                        settings_target_x = 0;
					}
					if (i == 2) { // "Выход"
						game_end();
					}
                }
            }
        }
		if (mouse_check_button_pressed(mb_right)) {
			change_attribute++;
			if (change_attribute > 2) change_attribute = 0;
		}
		if (change_attribute == 0) global.PlayerMainAttribute = "STRENGTH";
		if (change_attribute == 1) global.PlayerMainAttribute = "AGILITY";
		if (change_attribute == 2) global.PlayerMainAttribute = "INTELEGENCE";
	break;
	case menu_state.transition_to_game:
        logo_target_y = -100;
		for (var i = 0; i < 3; i++) {
            button_current_y[i] = lerp(button_current_y[i], button_target_y[i], transition_speed);
        }
	break;
	case menu_state.transition_to_settings:
        for (var i = 0; i < 3; i++) {
            button_current_y[i] = lerp(button_current_y[i], button_target_y[i], transition_speed);
        }
        
        settings_x = lerp(settings_x, settings_target_x, transition_speed);
        
        if (abs(settings_x - settings_target_x) < 5) {
            state = menu_state.settings;
        }
	break;
	case menu_state.settings:
		var elements_y = [400, 470, 385, 455, 500];
		
        var back_x = room_width - 50;
        var back_y = elements_y[4];
        var back_w = string_width("Back") + 100;
        var back_h = 60;
        settings_hover[4] = point_in_rectangle(mouse_x, mouse_y, 
            back_x - back_w/2, back_y - back_h/2, 
            back_x + back_w/2, back_y + back_h/2);
        
        var music_x = room_width / 4 - slider_width / 2;
        var music_y = elements_y[0];
        settings_hover[0] = point_in_rectangle(mouse_x, mouse_y, 
            music_x, music_y - slider_height - 15, 
            music_x + slider_width, music_y + slider_height - 15);
            
        var sound_x = room_width / 4 - slider_width/2;
        var sound_y = elements_y[1];
        settings_hover[1] = point_in_rectangle(mouse_x, mouse_y, 
            sound_x, sound_y - slider_height, 
            sound_x + slider_width, sound_y + slider_height);
            
        var fullscreen_x = room_width - 150;
        var fullscreen_y = elements_y[2];
        settings_hover[2] = point_in_rectangle(mouse_x, mouse_y, 
            fullscreen_x - 150, fullscreen_y - 30, 
            fullscreen_x + 150, fullscreen_y + 30);
            
        var lang_x = room_width - 130;
        var lang_y = elements_y[3];
        settings_hover[3] = point_in_rectangle(mouse_x, mouse_y, 
            lang_x - 150, lang_y - 30, 
            lang_x + 150, lang_y + 30);
        
        for (var i = 0; i < 5; i++) {
            var target_scale = settings_hover[i] ? hover_scale : 1.0;
            settings_scale[i] = lerp(settings_scale[i], target_scale, scale_speed);
        }
		
		if (mouse_check_button_pressed(mb_left)) {
            // Кнопка "Назад"
            if (settings_hover[4]) {
				audio_play_sound(snd_choose_mouse, 100, 0);
				state = menu_state.main;
                settings_target_x = room_width;
				var _button_target_y = [400, 450, 500];
                for (var i = 0; i < 3; i++) {
                    button_target_y[i] = _button_target_y[i];
                }
            }
            
            // Переключение языка
            if (settings_hover[3]) {
				audio_play_sound(snd_choose_mouse, 100, 0);
				global.language++;
				if (global.language > count_active_languages) global.language = 1;
				button_texts = [get_translate(global.translate_grid, "sttg_start_game"),
								get_translate(global.translate_grid, "sttg_setting"),
								get_translate(global.translate_grid, "sttg_exit")];
				setting_button_texts = [get_translate(global.translate_grid, "sttg_music_volume"), 
										get_translate(global.translate_grid, "sttg_sound_volume"), 
										get_translate(global.translate_grid, "sttg_fullscreen"), 
										get_translate(global.translate_grid, "sttg_language"), 
										get_translate(global.translate_grid, "sttg_back")];
				change_attribite = get_translate(global.translate_grid, "sttg_change_attribute");
            }
            
            // Переключение полноэкранного режима
            if (settings_hover[2]) {
				audio_play_sound(snd_choose_mouse, 100, 0);
				fullscreen = !fullscreen;
				global.SettingFullScreen = fullscreen;
                window_set_fullscreen(fullscreen);
            }
        }
        
        if (mouse_check_button(mb_left)) {
            // Слайдер музыки
            var music_x = room_width/4 - slider_width/2;
            var music_y = elements_y[0];
            if (settings_hover[0] || dragging_music) {
                dragging_music = true;
                var pos = clamp(mouse_x - music_x, 0, slider_width);
                music_volume = pos / slider_width;
                global.SettingMusicVolume = music_volume;
            }
            
            // Слайдер звуков
            var sound_x = room_width/4 - slider_width/2;
            var sound_y = elements_y[1];
            if (settings_hover[1] || dragging_sound) {
                dragging_sound = true;
                var pos = clamp(mouse_x - sound_x, 0, slider_width);
                sound_volume = pos / slider_width;
                global.SettingSoundVolume = sound_volume;
            }
        } else {
            dragging_music = false;
            dragging_sound = false;
        }
	break;
}