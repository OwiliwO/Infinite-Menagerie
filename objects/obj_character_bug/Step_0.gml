/// @description Итерация эффекта возмездия


event_inherited();
if (statistic_OLD_HP != statistic_HP && is_update_statistic) {
	var _revenge_damage = abs(statistic_HP - statistic_OLD_HP) div 4;
	if (_revenge_damage <= 0) _revenge_damage = 1;
	src_revenge_buff(40, obj_character_main.grid_x, obj_character_main.grid_y, _revenge_damage);
	statistic_OLD_HP = statistic_HP;
}
