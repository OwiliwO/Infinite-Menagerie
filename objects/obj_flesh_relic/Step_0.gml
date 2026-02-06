/// @description Итерация


event_inherited();

if (is_owned && !is_owned_passive) {
	with (obj_character_main) {
		alarm[0] = 1;
	}
	is_owned_passive = true;
}

if (instance_exists(obj_character_main)) {
	with (obj_character_main) {
		var _dmg = other.current_life - statistic_HP;
		if (statistic_MP > 0) {
			if (other.current_life > statistic_HP) {
				statistic_MP -= _dmg;
				if (statistic_MP < 0) {
					statistic_HP = other.current_life
					statistic_HP -= abs(statistic_MP);
					statistic_MP = 0;
				}
				else statistic_HP = other.current_life;
			}
		}
	}
}