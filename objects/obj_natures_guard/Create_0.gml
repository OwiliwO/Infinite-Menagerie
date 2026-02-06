/// @description Инициализация

event_inherited();
item_name = "Nature's Guard";
item_description = get_translate(global.translate_grid, "desc_ALL_item_natures_guard");
item_cost = 160;
item_rarity = 0;
item_equipment_buff = 2;
is_enteraction = false;
sprite_index = spr_ui_items_equipment;
sprite_particle_index = obj_particle_item_natures_guard;
image_index = 6;


function use_item(user) {
    
    return false;
}