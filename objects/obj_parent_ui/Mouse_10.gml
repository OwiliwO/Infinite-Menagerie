/// @description Анимация +


target_up = max_up;
if (is_enteraction && visible) {
	cursor_sprite = spr_ui_cursor_active;
}

if (visible) {
	audio_play_sound(snd_hover, 100, 0);
}
