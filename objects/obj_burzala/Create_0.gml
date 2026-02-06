/// @description Инициализация

event_inherited();
item_name = "Burzala";
item_description = get_translate(global.translate_grid, "desc_ALL_item_burzala");
item_cost = 320;
item_rarity = 2;
item_equipment_buff = 6;
is_enteraction = false;
sprite_index = spr_ui_items_equipment;
sprite_particle_index = obj_particle_item_burzala;
image_index = 5;


function use_item(user) {
    
    return false;
}