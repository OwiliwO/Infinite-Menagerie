/// @description Инициализация

event_inherited();
item_name = "Treatment Bottle";
item_description = get_translate(global.translate_grid, "desc_ALL_item_treatment_bottle");
item_cost = 40;
item_rarity = 4;
sprite_index = spr_ui_items_consumable;
sprite_particle_index = obj_particle_item_treatment_bottle;
image_index = 3;


function use_item(user) {
    var target = user;
	var add = 5;
    
    if (instance_exists(target)) {
		target.statistic_HP += add;
		if (target.statistic_HP > target.statistic_MAX_HP) target.statistic_HP = target.statistic_MAX_HP;
		target.statistic_OLD_HP = target.statistic_HP;

        src_clue(target, add, global.DescHP, c_red);
        
        return true;
    }
    
    return false;
}