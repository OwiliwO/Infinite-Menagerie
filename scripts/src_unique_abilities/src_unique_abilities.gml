

function src_create_item_shop() {
	if (instance_exists(obj_character_secret_shop)) {
		with (obj_character_secret_shop) {
			if (instance_exists(random_item_consumable)) {
				with (random_item_consumable) if (!is_owned) instance_destroy();
			}
			if (instance_exists(random_item_equipment)) {
				with (random_item_equipment) if (!is_owned) instance_destroy();
			}
			if (instance_exists(random_item_things_1)) {
				with (random_item_things_1) if (!is_owned) instance_destroy();
			}
			if (instance_exists(random_item_things_2)) {
				with (random_item_things_2) if (!is_owned) instance_destroy();
			}
		
			var equipment_lvl = 1;
			var arr_equipment = arr_items_equipment_1_lvl;

			for (var i = 0; i < 6; i++) {
				var slot = obj_character_main.inventory_slots[i];
				if (!slot.is_empty) {
			        var item = slot.item_in_slot;
			        if (instance_exists(item)) {
						if (item.object_index == obj_poor_sword) {
				            array_push(arr_equipment, arr_items_equipment_2_lvl[0])
				        }
						if (item.object_index == obj_claymore) {
				            array_push(arr_equipment, arr_items_equipment_3_lvl[0])
				        }
						if (item.object_index == obj_natures_guard) {
				            array_push(arr_equipment, arr_items_equipment_2_lvl[1])
				        }
						if (item.object_index == obj_stout_shield) {
				            array_push(arr_equipment, arr_items_equipment_3_lvl[1])
				        }
						if (item.object_index == obj_reed) {
				            array_push(arr_equipment, arr_items_equipment_2_lvl[2])
				        }
						if (item.object_index == obj_vignette) {
				            array_push(arr_equipment, arr_items_equipment_3_lvl[2])
				        }
					}
			    }
			}

			arr_items_equipment_current = arr_equipment;

			random_item_consumable = arr_items_consumable[irandom_range(0, array_length(arr_items_consumable) - 1)];
			random_item_equipment = arr_items_equipment_current[irandom_range(0, array_length(arr_items_equipment_current) - 1)];
			random_item_things_1 = arr_items_things[irandom_range(0, array_length(arr_items_things) - 1)];
			random_item_things_2 = arr_items_things[irandom_range(0, array_length(arr_items_things) - 1)];

			instance_create_layer(320, 200, "UI", random_item_equipment);
			instance_create_layer(400, 150, "UI", random_item_things_1);
			instance_create_layer(500, 150, "UI", random_item_things_2);
			instance_create_layer(580, 200, "UI", random_item_consumable);

			
			arr_items_equipment_current = [];
		}
		
		return true;
	}
	
	return false;
}

function src_rage_buff() {
	var target = argument0;
	var add_count = argument1;
	var add = argument2;
	
	target.statistic_MP -= mana_cost;
	var _modify = instance_create_layer(0, 0, "UI", obj_modify_rage);
	_modify.modify_id = target;
	_modify.modify_count = add_count;
	_modify.modify_AP = add;
}

function src_grow_buff() {
	var target = argument0;
	var grow_target = argument1;
	
	var _modify = instance_create_layer(0, 0, "UI", obj_modify_grow);
	_modify.modify_id = target;
	_modify.modify_target_grow = grow_target;
}

function src_bleeding_buff() {
	if (scr_percent(argument0)) {
		var target = noone;
	    with (obj_slot_map) {
	        if (grid_x == argument1 && grid_y == argument2 && is_occupied) {
	            target = occupying_object;
	            break;
	        }
	    }
		var _modify = instance_create_layer(0, 0, "UI", obj_modify_bleeding);
		_modify.modify_id = target;
	}
}

function src_double_turn_buff() {
	if (scr_percent(argument0)) {
		src_clue(id, -1, "Double Turn", c_green);
		statistic_AP++;
	}
}

function src_disarm_buff() {
	if (scr_percent(argument0)) {
		var target = noone;
	    with (obj_slot_map) {
	        if (grid_x == argument1 && grid_y == argument2 && is_occupied) {
	            target = occupying_object;
	            break;
	        }
	    }
		var _modify = instance_create_layer(0, 0, "UI", obj_modify_disarm);
		_modify.modify_id = target;
	}
}

function src_root_buff() {
	if (scr_percent(argument0)) {
		var target = noone;
	    with (obj_slot_map) {
	        if (grid_x == argument1 && grid_y == argument2 && is_occupied) {
	            target = occupying_object;
	            break;
	        }
	    }
		var _modify = instance_create_layer(0, 0, "UI", obj_modify_root);
		_modify.modify_id = target;
	}
}

function src_revenge_buff() {
	if (scr_percent(argument0)) {
		create_particles_eight_direction(obj_particle_thorn);
		var target = noone;
	    with (obj_slot_map) {
	        if (grid_x == argument1 && grid_y == argument2 && is_occupied) {
	            target = occupying_object;
	            break;
	        }
	    }
		var _color = c_white;
		if (argument3 < 10) _color = c_orange;
		if (argument3 >= 10 && argument3 < 20) _color = c_red;
		src_clue(target.id, argument3, global.DescHP, _color);
		target.statistic_HP -= argument3;
		
		if (target.statistic_HP <= 0 && !target.is_double_life) 
		{
			if (object_get_parent(target.object_index) == obj_parent_characters_enemies) {
				if (obj_manager_main.current_enemies != -1) obj_manager_main.current_enemies--;
			}
			instance_destroy(target);
		}
	}
}

function src_dodge_buff() {
	if (scr_percent(argument0)) {
		src_clue(id, -1, "Dodge Attack", c_green);
		move_to_random(id);
		statistic_HP = argument1;
	}
}