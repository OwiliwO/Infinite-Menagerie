/// @description Визуализация статистики


audio_play_sound(snd_choose_mouse, 100, 0);

if (instance_exists(obj_tooltip_statistic) && array_length(obj_tooltip_statistic.games) > 0) {
	obj_tooltip_statistic.show_stats = true;
	obj_tooltip_statistic.current_game_index = 0;
}


