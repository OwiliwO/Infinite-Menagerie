/// @description Инициализация


event_inherited();
item_name = "Heroic Emblem";
item_description = get_translate(global.translate_grid, "desc_ALL_item_none");
item_cost = 9000;
item_rarity = 3;
is_enteraction = false;
sprite_index = spr_ui_items_thing;
sprite_particle_index = obj_particle_item_heroic_emblem;
image_index = 10;


function use_item(user) {
    
	
    return false;
}