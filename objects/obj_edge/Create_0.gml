/// @description Инициализация


event_inherited();
item_name = "Edge";
item_description = get_translate(global.translate_grid, "desc_ALL_item_edge");
item_cost = 280;
item_rarity = 3;
item_current_AP = 0;
is_enteraction = false;
sprite_index = spr_ui_items_thing;
sprite_particle_index = obj_particle_item_edge;
image_index = 13;


function use_item(user) {
    
	
    return false;
}