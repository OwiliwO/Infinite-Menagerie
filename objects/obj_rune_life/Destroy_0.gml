/// @description Восполнение ОЗ


event_inherited();
if (instance_exists(obj_character_main)) {
	obj_character_main.statistic_HP += statistic_add;
	if (obj_character_main.statistic_HP > obj_character_main.statistic_MAX_HP) obj_character_main.statistic_HP = obj_character_main.statistic_MAX_HP;
	if (statistic_add != 0) {
		global.PlayerGoldCount += statistic_GOLD;
		src_clue(obj_character_main, statistic_GOLD, global.DescGold, c_yellow);
	}
	if (statistic_add != 0 && obj_character_main.statistic_HP <= obj_character_main.statistic_MAX_HP - statistic_add) src_clue(obj_character_main, statistic_add, global.DescHP, c_red);
}
