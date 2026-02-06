/// @description Итерация


event_inherited();
if (obj_character_main.is_active_turn) visible = true; else visible = false;

text_description = get_translate(global.translate_grid, "desc_coin_of_greed") + string(global.PlayerGoldCount);