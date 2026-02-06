/// @description Использование предмета


if (position_meeting(mouse_x, mouse_y, id) && !global.SlideSide) {
    if (!is_empty) {
		audio_play_sound(snd_choose_mouse, 100, 0);
		use_item_in_slot();
    }
}