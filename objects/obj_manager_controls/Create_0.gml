/// @description Инициализация


src_globalvariables();

audio_group_load(audiogroup_sound);
audio_group_set_gain(audiogroup_default, global.SettingMusicVolume, 0);
audio_group_set_gain(audiogroup_sound, global.SettingSoundVolume, 0);

audio_play_sound(msc_fantasy, 90, 1);

alarm[0] = 10;

quick_cast_ability_1   = "Q";
quick_cast_ability_2   = "W";
quick_cast_ability_3   = "E";
quick_cast_ability_4   = "R";

quick_cast_item_1      = "1";
quick_cast_item_2      = "2";
quick_cast_item_3      = "3";
quick_cast_item_4      = "4";
quick_cast_item_5      = "5";
quick_cast_item_6      = "6";

transition_speed       = 100;
is_transition_start    = true;

if (!variable_global_exists("transition_fx")) {
    global.transition_fx = fx_create("_filter_pixelate");
    layer_set_fx("Effect", global.transition_fx);
}