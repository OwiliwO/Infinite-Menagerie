/// @description Инициализация


event_inherited();
item_name = "Thumb of Midas";
item_description = get_translate(global.translate_grid, "desc_ALL_item_thumb_of_midas");
item_cost = 40;
item_rarity = 3;
item_add_gold = 30;
is_enteraction = false;
sprite_index = spr_ui_items_thing;
sprite_particle_index = obj_particle_item_thumb_of_midas;
image_index = 7;


function use_item(user) {
    
	
    return false;
}