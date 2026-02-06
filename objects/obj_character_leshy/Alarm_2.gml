/// @description Действие


var nearest_player = instance_nearest(x, y, obj_character_main);
// 0 - Создание доп. врага
// 1 - Дополнительная атака
// 2 - Атака на кровотечение
// 3 - Атака на обезоруживание
// 4 - Атака на обездвиживание
// 5 - Ничего
var input_effect = irandom(5);

if (statistic_AP > 0) {
	if (instance_exists(nearest_player)) {
	    var range = statistic_SPEED_ATTACK;
		if (is_player_in_range(nearest_player, range)) {
			if (!attack_melee_turn(nearest_player)) {
				if (!move_turn(nearest_player)) skip_turn();
			} else {
				if (instance_exists(nearest_player) && input_effect == 1) src_double_turn_buff(100);
				if (instance_exists(nearest_player) && input_effect == 2) src_bleeding_buff(100, nearest_player.grid_x, nearest_player.grid_y);
				if (instance_exists(nearest_player) && input_effect == 3) src_disarm_buff(100, nearest_player.grid_x, nearest_player.grid_y);
				if (instance_exists(nearest_player) && input_effect == 4) src_root_buff(100, nearest_player.grid_x, nearest_player.grid_y);
			}
		} else {
			if (!move_turn(nearest_player)) skip_turn();
		}
		alarm[2] = 60;
	} else {
	    skip_turn();
		alarm[2] = 1;
	}
} else {
	if (input_effect == 0) {
		var input_object = irandom(9);
		if (input_object == 0) create_allies_turn(obj_character_bug, true);
		if (input_object == 1) create_allies_turn(obj_character_bulldog, true);
		if (input_object == 2) create_allies_turn(obj_character_cat, true);
		if (input_object == 3) create_allies_turn(obj_character_dragonfly, true);
		if (input_object == 4) create_allies_turn(obj_character_fox, true);
		if (input_object == 5) create_allies_turn(obj_character_mantis, true);
		if (input_object == 6) create_allies_turn(obj_character_pig, true);
		if (input_object == 7) create_allies_turn(obj_character_rabbit, true);
		if (input_object == 8) create_allies_turn(obj_character_wild_dog, true);
		if (input_object == 9) create_allies_turn(obj_character_wild_puppy, true);
	}
	end_turn();
}