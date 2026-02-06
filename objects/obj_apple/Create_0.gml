/// @description Инициализация

event_inherited();
item_name = "Apple";
item_description = get_translate(global.translate_grid, "desc_ALL_item_apple");
item_cost = 30;
item_rarity = 5;
sprite_index = spr_ui_items_food;
sprite_particle_index = obj_particle_item_apple;
image_index = 0;


function use_item(user) {
    var target = user;
	var add = 2;
    
    if (instance_exists(target)) {
        target.statistic_AGILITY += add;
		with (target) alarm[0] = 1;
		with (obj_manager_main) update_curse();

        src_clue(target, add, "Agility", c_green);
        
        return true;
    }
    
    return false;
}