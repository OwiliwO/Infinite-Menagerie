/// @description Действие


var nearest_player = instance_nearest(x, y, obj_character_main);

if (statistic_AP > 0) {
	if (instance_exists(nearest_player)) {
	    if (nearest_player.image_mask != 0 && statistic_HP >= statistic_MAX_HP) {
			skip_turn();
			instance_create_layer(drawing_x + sprite_width / 4 + 5, drawing_y - 15, "UI", obj_question);
			alarm[2] = 1;
		} else {
			if (!attack_lunge_turn(nearest_player)) {
				if (!attack_melee_turn(nearest_player)) {
					if (!move_turn(nearest_player)) skip_turn();
				}
			}
			alarm[2] = 60;
		}
	} else {
	    skip_turn();
		alarm[2] = 1;
	}
} else end_turn();