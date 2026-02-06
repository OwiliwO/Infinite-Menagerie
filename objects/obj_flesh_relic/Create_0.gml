/// @description Инициализация


event_inherited();
item_name = "Flesh Relic";
item_description = get_translate(global.translate_grid, "desc_ALL_item_flesh_relic");
item_cost = 290;
item_rarity = 3;
is_enteraction = false;
current_life = obj_character_main.statistic_HP;
sprite_index = spr_ui_items_thing;
sprite_particle_index = obj_particle_item_flesh_relic;
image_index = 11;


function use_item(user) {
    
	
    return false;
}