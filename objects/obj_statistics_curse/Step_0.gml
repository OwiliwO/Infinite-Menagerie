/// @description Итерация


event_inherited();
if (obj_character_main.is_active_turn) visible = true; else visible = false;

text_naming = "Argument of Curse";

if (obj_character_main.image_index == 0) {
	text_description = get_translate(global.translate_grid, "desc_statistic_Curse_str");
}
if (obj_character_main.image_index == 1) {
	text_description = get_translate(global.translate_grid, "desc_statistic_Curse_agl");
}
if (obj_character_main.image_index == 2) {
	text_description = get_translate(global.translate_grid, "desc_statistic_Curse_int");
}