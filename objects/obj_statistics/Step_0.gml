/// @description Итерация


event_inherited();
if (obj_character_main.is_active_turn) visible = true; else visible = false;

if (image_index == 0) {
	text_naming = "Argument of Strength";
	text_description = get_translate(global.translate_grid, "desc_statistic_Strength") + string(obj_character_main.statistic_STRENGTH);
}
if (image_index == 1) {
	text_naming = "Argument of Agility";
	text_description = get_translate(global.translate_grid, "desc_statistic_Agility") + string(obj_character_main.statistic_AGILITY);
}
if (image_index == 2) {
	text_naming = "Argument of Intelligence";
	text_description = get_translate(global.translate_grid, "desc_statistic_Intelligence") + string(obj_character_main.statistic_INTELEGENCE);
}