/// @description Инициализация


event_inherited();
item_name = "Galvangar's Ring";
item_description = get_translate(global.translate_grid, "desc_ALL_item_galvangar_ring");
item_cost = 140;
item_rarity = 3;
is_enteraction = false;
sprite_index = spr_ui_items_thing;
sprite_particle_index = obj_particle_item_galvangar_ring;
image_index = 1;


function use_item(user) {
    
	
    return false;
}