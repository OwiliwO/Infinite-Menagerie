/// @description Инициализация


event_inherited();
item_name = "Miracle's Love";
item_description = get_translate(global.translate_grid, "desc_ALL_item_miracles_love");
item_cost = 240;
item_rarity = 3;
is_enteraction = false;
sprite_index = spr_ui_items_thing;
sprite_particle_index = obj_particle_item_miracles_love;
image_index = 12;


function use_item(user) {
    
	
    return false;
}