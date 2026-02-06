/// @description Инициализация


event_inherited();
item_name = "Helmet of Marauder";
item_description = get_translate(global.translate_grid, "desc_ALL_item_helmet_of_marauder");
item_cost = 250;
item_rarity = 3;
is_enteraction = false;
sprite_index = spr_ui_items_thing;
sprite_particle_index = obj_particle_item_helmet_of_marauder;
image_index = 5;


function use_item(user) {
    
	
    return false;
}