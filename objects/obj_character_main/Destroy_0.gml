/// @description Удаление системы


event_inherited();

var _target_follow = false;
if (!instance_exists(obj_manager_win_screen) && obj_manager_main.current_wave + 1 > 72) {
	var _dead_screen = instance_create_layer(0, 0, "UI", obj_manager_win_screen);
	_target_follow = true;
}

array_push(current_try, date_current_datetime());										// Текущая дата
array_push(current_try, _target_follow);											    // Выполнена ли цель
if (obj_manager_main.current_wave + 1 < 72) array_push(current_try, global.CountWaves);
else array_push(current_try, global.CountWaves + 1);                                    // Количество волн
array_push(current_try, statistic_MAX_HP);                                              // Максимальное ОЗ
array_push(current_try, statistic_MAX_MP);                                              // Максимальное ОК
array_push(current_try, statistic_MAX_AP);												// Максимальное ОД
array_push(current_try, image_index);												    // Основной атрибут
array_push(current_try, statistic_STRENGTH);											// Атрибут Силы
array_push(current_try, statistic_AGILITY);												// Атрибут Ловкости
array_push(current_try, statistic_INTELEGENCE);											// Атрибут Интеллекта
var inventory_slots_name = [];
for (var i = 0; i < 6; i++) {
	if (!inventory_slots[i].is_empty) {
	    array_push(inventory_slots_name, inventory_slots[i].item_in_slot.item_name);
	}
}
array_push(current_try, inventory_slots_name);   // Инвентарь
array_push(global.StaticticGames, current_try);

if (!instance_exists(obj_manager_dead_screen) && obj_manager_main.current_wave + 1 <= 72) {
	var _dead_screen = instance_create_layer(0, 0, "UI", obj_manager_dead_screen);
	if (last_hit != noone) _dead_screen.dead_phrase = last_hit.death_phrase;
}

SaveStatisticsGamesFunction();

if (instance_exists(obj_tooltip_education)) with (obj_tooltip_education)  instance_destroy();
if (instance_exists(obj_tooltip_static))    with (obj_tooltip_static)     instance_destroy();
with (obj_parent_characters_enemies)  instance_destroy();
with (obj_parent_characters_neutrals) instance_destroy();
with (obj_parent_modify)              instance_destroy();
with (obj_parent_ui)                  instance_destroy();
with (obj_parent_items)               instance_destroy();
with (obj_manager_main)               instance_destroy();
with (obj_manager_wave)               instance_destroy();
with (obj_slot_map)                   instance_destroy();

obj_manager_controls.is_transition_start = false;
global.CountWaves = 0;
global.PlayerGoldCount = 100;
global.SlideSide = false;
global.TypeAbility = "None";
