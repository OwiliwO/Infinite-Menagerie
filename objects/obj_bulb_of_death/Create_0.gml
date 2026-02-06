/// @description Инициализация


event_inherited();
item_name = "Bulb of Death";
item_description = get_translate(global.translate_grid, "desc_ALL_item_bulb_of_death");
item_cost = 550;
item_rarity = 3;
sprite_index = spr_ui_items_thing;
sprite_particle_index = obj_particle_item_bulb_of_death;
image_index = 9;


function use_item(user) {
	sprite_index = spr_ui_items_thing_active;
	
	var _all_enemy_HP = 0;
	
	if (instance_exists(obj_parent_characters_enemies)) {
		with (obj_parent_characters_enemies) {
			_all_enemy_HP += statistic_HP;
			instance_destroy();
		}
	}
	
	if (instance_exists(obj_parent_characters_neutrals)) {
		with (obj_parent_characters_neutrals) {
			_all_enemy_HP += statistic_HP;
			instance_destroy();
		}
	}
	
	if (instance_exists(obj_parent_characters_allies)) {
		with (obj_parent_characters_allies) {
			_all_enemy_HP += statistic_HP;
			instance_destroy();
		}
	}
	
	_all_enemy_HP = round(_all_enemy_HP / 4);
	
	if (instance_exists(obj_character_main)) {
		obj_character_main.statistic_HP -= _all_enemy_HP;
		if (obj_character_main.statistic_HP <= 0 && !obj_character_main.is_double_life) {
			with(obj_character_main) instance_destroy();
	    }
		
	}
	
	obj_character_main.statistic_AP--;
	
	alarm[0] = 10;
    return false;
}