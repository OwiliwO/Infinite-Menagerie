/// @description Итерация эффекта уклонения


event_inherited();
if (statistic_OLD_HP != statistic_HP && is_update_statistic) {
	src_dodge_buff(45, statistic_OLD_HP);
	statistic_OLD_HP = statistic_HP;
}