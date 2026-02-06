/// @description Действие


var nearest_player = instance_nearest(x, y, obj_character_main);

if (statistic_AP > 0) {
	if (instance_exists(nearest_player)) {
	    var range = statistic_SPEED_ATTACK;
		if (is_player_in_range(nearest_player, range)) {
			if (!attack_melee_turn(nearest_player)) {
				if (!move_turn(nearest_player)) skip_turn();
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
	is_active_heal = false;
	end_turn();
}