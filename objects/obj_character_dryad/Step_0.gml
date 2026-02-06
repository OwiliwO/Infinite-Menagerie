/// @description Итерация


event_inherited();

if (instance_exists(obj_parent_characters_enemies) && is_active_turn && !is_active_heal) {
	with (obj_parent_characters_enemies) {
		if (statistic_MAX_HP != statistic_HP + other.statistic_HEALTH && statistic_MAX_HP != statistic_HP) {
			statistic_HP += other.statistic_HEALTH;
			src_clue(id, other.statistic_HEALTH, global.DescHP, c_red);
			if (statistic_HP > statistic_MAX_HP) {
				statistic_HP = statistic_MAX_HP;
			}
		}
	}
	is_active_heal = true;
}