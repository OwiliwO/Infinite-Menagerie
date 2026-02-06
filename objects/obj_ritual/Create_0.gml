/// @description Инициализация


event_inherited();
item_name = "Ritual";
item_description = get_translate(global.translate_grid, "desc_ALL_item_ritual");
item_cost = 220;
item_rarity = 3;
item_count_exist = 10;
is_enteraction = false;
sprite_index = spr_ui_items_thing;
sprite_particle_index = obj_particle_item_ritual;
image_index = 6;


function use_item(user) {
    
	
    return false;
}