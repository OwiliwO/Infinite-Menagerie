/// @description Действие


var nearest_instance = instance_nearest(x, y, obj_parent_characters_enemies);

if (statistic_AP > 0) {
	if (instance_exists(nearest_instance) && object_get_name(nearest_instance.object_index) != "obj_character_secret_shop") {
	    var range = statistic_SPEED_ATTACK;
		if (is_player_in_range(nearest_instance, range)) {
			if (!attack_melee_turn(nearest_instance)) {
				if (!move_turn(nearest_instance)) skip_turn();
			}
		} else {
			if (!move_turn(nearest_instance)) skip_turn();
		}
	} else {
	    skip_turn();
	}
	alarm[2] = 60;
} else end_turn();