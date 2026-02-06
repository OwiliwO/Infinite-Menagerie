/// @description Итерация


event_inherited();

#region === ИТЕРАЦИЯ УДЕРЖАНИЯ СТАТИСТИЧЕСКИХ ДАННЫХ ===
statistic_MAX_HP = round(statistic_STRENGTH * base_grow_STRENGTH / 3 * obj_manager_main.multiplier);
if (statistic_MAIN_ATTRIBUTE == "STRENGTH")    statistic_DAMAGE = round(statistic_STRENGTH * base_grow_STRENGTH / 6 * obj_manager_main.multiplier);
if (statistic_MAIN_ATTRIBUTE == "INTELEGENCE") statistic_DAMAGE = round(statistic_INTELEGENCE * base_grow_INTELEGENCE / 6 * obj_manager_main.multiplier);
if (statistic_MAIN_ATTRIBUTE == "AGILITY")     statistic_DAMAGE = round(statistic_AGILITY * base_grow_AGILITY / 6 * obj_manager_main.multiplier);
#endregion