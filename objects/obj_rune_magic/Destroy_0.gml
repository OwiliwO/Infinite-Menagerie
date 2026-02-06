/// @description Восполнение ОК


event_inherited();
if (instance_exists(obj_character_main)) {
	obj_character_main.statistic_MP += statistic_add;
	if (obj_character_main.statistic_MP > obj_character_main.statistic_MAX_MP) obj_character_main.statistic_MP = obj_character_main.statistic_MAX_MP;
	if (statistic_add != 0) {
		global.PlayerGoldCount += statistic_GOLD;
		src_clue(obj_character_main, statistic_GOLD, global.DescGold, c_yellow);
	}
	if (statistic_add != 0 && obj_character_main.statistic_MP <= obj_character_main.statistic_MAX_MP - statistic_add) src_clue(obj_character_main, statistic_add, global.DescMP, c_aqua);
}