/// @description Инициализация


#region === ИНИЦИАЛИЗАЦИЯ СОСТОЯНИЙ МЕНЮ ===
enum menu_state			{
					    main,
					    transition,
						settings,
					    transition_to_settings,
						transition_to_game
						}
state                  = menu_state.main;
#endregion

#region === ИНИЦИАЛИЗАЦИЯ ДОПОЛНИТЕЛЬНЫХ ПЕРЕМЕННЫХ ===
max_count_waves        = 0;
active_flag            = false;
hover_color            = make_color_rgb(100, 119, 125);
scale_color            = make_color_rgb(248, 241, 229);

logo_start_y           = 0;
logo_target_y          = 100;
logo_speed             = 0.05;
current_logo_y         = logo_start_y;

buttons                = array_create(3);
button_texts           = [get_translate(global.translate_grid, "sttg_start_game"),
						  get_translate(global.translate_grid, "sttg_setting"),
						  get_translate(global.translate_grid, "sttg_exit")];
button_start_y         = room_height + 100;
button_target_y        = [400, 450, 500];
button_current_y       = array_create(3, button_start_y);
button_speed           = 0.08;
button_width           = array_create(3);
button_height          = 60;
button_hover           = array_create(3, false);
button_scale           = array_create(3, 1.0);

setting_button_texts   = [get_translate(global.translate_grid, "sttg_music_volume"), 
						  get_translate(global.translate_grid, "sttg_sound_volume"), 
						  get_translate(global.translate_grid, "sttg_fullscreen"), 
						  get_translate(global.translate_grid, "sttg_language"), 
						  get_translate(global.translate_grid, "sttg_back")];
settings_x             = room_width;
settings_target_x      = room_width;
settings_items         = array_create(5);
settings_hover         = array_create(5, false);
settings_scale         = array_create(5, 1.0);

hover_scale            = 1.2;
scale_speed            = 0.2;
transition_speed       = 0.08;
selected_slot          = 0;
back_target_y          = 900;
_back_y                = back_target_y;

music_volume           = global.SettingMusicVolume;
sound_volume           = global.SettingSoundVolume;
slider_width           = 400;
slider_height          = 30;
slider_handle_width    = 20;
dragging_music         = false;
dragging_sound         = false;

count_active_languages = 2;
current_language       = global.language;
change_attribute       = 0;
clue_change_attribute  = false;
change_attribite       = get_translate(global.translate_grid, "sttg_change_attribute");

fullscreen             = window_get_fullscreen();

for (var i = 0; i < 3; i++) {
    button_width[i] = string_width(button_texts[i]) + 100;
}
#endregion

#region === ИНИЦИАЛИЗАЦИЯ ОСНОВНЫХ ФУНКЦИЙ ===
function find_max_stats() {
    if (array_length(global.StaticticGames) == 0) {
        return -1;
    }
    
    var max_waves = 0;
    var max_hp = 0;
    var max_mp = 0;
    var max_ap = 0;
    var max_strength = 0;
    var max_agility = 0;
    var max_intelligence = 0;
    
    for (var i = 0; i < array_length(global.StaticticGames); i++) {
        var current_game = global.StaticticGames[i];
        
        if (current_game[1] > max_waves) max_waves = current_game[1];
        if (current_game[2] > max_hp) max_hp = current_game[2];
        if (current_game[3] > max_mp) max_mp = current_game[3];
        if (current_game[4] > max_ap) max_ap = current_game[4];
        if (current_game[6] > max_strength) max_strength = current_game[6];
        if (current_game[7] > max_agility) max_agility = current_game[7];
        if (current_game[8] > max_intelligence) max_intelligence = current_game[8];
    }
    
    return [max_waves, max_hp, max_mp, max_ap, max_strength, max_agility, max_intelligence];
}
#endregion