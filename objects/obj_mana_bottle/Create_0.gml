/// @description Инициализация

event_inherited();
item_name = "Mana Bottle";
item_description = get_translate(global.translate_grid, "desc_ALL_item_mana_bottle");
item_cost = 40;
item_rarity = 4;
sprite_index = spr_ui_items_consumable;
sprite_particle_index = obj_particle_item_mana_bottle;
image_index = 1;


function use_item(user) {
    var target = user;
	var add = 5;
    
    if (instance_exists(target)) {
		target.statistic_MP += add;
		if (target.statistic_MP > target.statistic_MAX_MP) target.statistic_MP = target.statistic_MAX_MP;

        src_clue(target, add, global.DescMP, c_aqua);
        
        return true;
    }
    
    return false;
}