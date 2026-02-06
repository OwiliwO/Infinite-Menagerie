/// @description Инициализация


event_inherited();
item_name = "Mask of Rage";
item_description = get_translate(global.translate_grid, "desc_ALL_item_mask_of_rage");
item_cost = 100;
item_rarity = 3;
mana_cost = 2;
sprite_index = spr_ui_items_thing;
sprite_particle_index = obj_particle_item_mask_of_rage;
image_index = 3;


function use_item(user) {
    var target = user;
	var add = 5;
	var add_count = 2;
	
	sprite_index = spr_ui_items_thing_active;
	
	if (instance_exists(target)) {
		if (target.statistic_MP >= mana_cost) {
			target.statistic_AP--;
			target.is_buff_rage = true;
			src_rage_buff(target, add_count, add);
			src_clue(target, mana_cost, global.DescMP, c_aqua);
		}
	}
	
    return false;
}