/// @description Продажа предмета


if (position_meeting(mouse_x, mouse_y, id)) {
	if (is_owned) {
		if (instance_exists(obj_character_secret_shop)) {
			audio_play_sound(snd_item_sell, 101, 0);
			global.PlayerGoldCount += item_cost div 2;
		}
		with (obj_character_main) remove_item_from_inventory(other.id);
	}
}