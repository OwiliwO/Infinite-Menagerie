/// @description Эффект перехода


audio_group_set_gain(audiogroup_default, global.SettingMusicVolume, 0);
audio_group_set_gain(audiogroup_sound, global.SettingSoundVolume, 0);

if (transition_speed >= 0 && is_transition_start) transition_speed -= 1.5;
if (transition_speed <= 100 && !is_transition_start) transition_speed += 1.5;


if (transition_speed < 0) {
    layer_clear_fx("Effect");
} else {
    fx_set_parameter(global.transition_fx, "g_CellSize", transition_speed);
    if (layer_get_fx("Effect") != global.transition_fx) {
        layer_set_fx("Effect", global.transition_fx);
    }
}