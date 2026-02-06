/// @description Инициализация

event_inherited();
item_name = "Vignette";
item_description = get_translate(global.translate_grid, "desc_ALL_item_vignette");
item_cost = 240;
item_rarity = 1;
item_equipment_buff = 4;
is_enteraction = false;
sprite_index = spr_ui_items_equipment;
sprite_particle_index = obj_particle_item_vignette;
image_index = 4;


function use_item(user) {
    
    return false;
}