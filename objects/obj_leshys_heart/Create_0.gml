/// @description Инициализация


event_inherited();
item_name = "Leshy's Heart";
item_description = get_translate(global.translate_grid, "desc_ALL_item_leshys_heart");
item_cost = 1000;
item_rarity = 3;
sprite_index = spr_ui_items_thing;
sprite_particle_index = obj_particle_item_leshys_heart;
image_index = 8;


function use_item(user) {
    
	
    return false;
}