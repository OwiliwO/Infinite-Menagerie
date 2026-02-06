/// @description Инициализация


event_inherited();
item_name = "Eagle's Palm";
item_description = get_translate(global.translate_grid, "desc_ALL_item_eagles_palm");
item_cost = 100;
item_rarity = 3;
mana_cost = 5;
sprite_index = spr_ui_items_thing;
sprite_particle_index = obj_particle_item_eagles_palm;
image_index = 0;


function use_item(user) {
    var target = user;
	
	sprite_index = spr_ui_items_thing_active;
	
	if (instance_exists(target)) {
		if (target.statistic_MP >= mana_cost) {			
			target.statistic_AP--;
			target.statistic_MP -= mana_cost;
			target.is_buff_immortality = true;
			target.percent_buff_immortality = 100;
		}
	}
	
    return false;
}