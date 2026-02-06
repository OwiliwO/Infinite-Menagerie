/// @description Задержка перед переходом на новую волну


global.CountWaves = current_wave;
global.PlayerGoldCount += current_reward;

if (current_reward != 0) src_clue(obj_character_main, current_reward, global.DescGold, c_yellow);
current_reward = 0;

if (current_wave + 1 >= 36) {
	if (!instance_exists(obj_statistics_curse)) {
		instance_create_layer(746, 448, "Grid", obj_statistics_curse);
		with (obj_statistics) {
			if (image_index == 0) x = 158;
			if (image_index == 1) x = 354;
			if (image_index == 2) x = 550;
			drawing_x = x;
		}
		update_curse();
	}
}