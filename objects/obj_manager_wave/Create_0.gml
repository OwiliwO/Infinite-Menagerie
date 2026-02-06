/// @description Инициализация


total_chosen_struct       = 0;
total_chosen_env_struct   = irandom_range(1, 3);

#region === ИНИЦИАЛИЗАЦИЯ СТРУКТУР ВРАГОВ - SECRET SHOP - 0 ===
struct_enemies_0          = {
							total_count: 1,
							total_reward: 0,
							str_1: [obj_character_secret_shop, 1, [[2, 2]]]
							};
#endregion

#region === ИНИЦИАЛИЗАЦИЯ СТРУКТУР НЕЙТРАЛЬНЫХ ОБЪЕКТОВ ===
struct_env_0              =	{
							total_count: 0,
							str_1: 0
							};
struct_env_1              =	{
							total_count: 3,
							str_1: [obj_character_tree, 3, [[1, 3], [4, 1], [0, 1]]]
							};
struct_env_2              =	{
							total_count: 3,
							str_1: [obj_character_grove, 2, [[0, 3], [3, 1]]],
							str_2: [obj_character_log, 1, [[3, 4]]]
							};
struct_env_3              =	{
							total_count: 2,
							str_1: [obj_character_log, 1, [[1, 1]]],
							str_2: [obj_character_tree, 1, [[4, 3]]]
							};
struct_env_4              =	{
							total_count: 4,
							str_1: [obj_character_tree, 4, [[1, 2], [0, 3], [3, 2], [4, 3]]]
							};
#endregion

#region === ИНИЦИАЛИЗАЦИЯ СТРУКТУР ВРАГОВ - ЛЕГКИЙ УРОВЕНЬ - 1 - 10 ===
struct_enemies_1          = {
							total_count: 3,
							total_reward: 50,
							str_1: [obj_character_dummy, 2, [[1, 2], [3, 2]]],
							str_2: [obj_character_bulldog, 1, [[2, 0]]]
							};
struct_enemies_2          = {
							total_count: 1,
							total_reward: 30,
							str_1: [obj_character_bug, 1, [[2, 1]]]
							};
struct_enemies_3          = {
							total_count: 1,
							total_reward: 30,
							str_1: [obj_character_bulldog, 1, [[2, 0]]]
							};
struct_enemies_4          = {
							total_count: 1,
							total_reward: 30,
							str_1: [obj_character_cat, 1, [[2, 1]]]
							};
struct_enemies_5          = {
							total_count: 1,
							total_reward: 30,
							str_1: [obj_character_dragonfly, 1, [[2, 1]]]
							};
struct_enemies_6          = {
							total_count: 1,
							total_reward: 30,
							str_1: [obj_character_fox, 1, [[2, 0]]]
							};
struct_enemies_7          = {
							total_count: 1,
							total_reward: 30,
							str_1: [obj_character_mantis, 1, [[2, 0]]]
							};
struct_enemies_8          = {
							total_count: 1,
							total_reward: 30,
							str_1: [obj_character_pig, 1, [[2, 1]]]
							};
struct_enemies_9          = {
							total_count: 1,
							total_reward: 30,
							str_1: [obj_character_rabbit, 1, [[2, 1]]]
							};
struct_enemies_10          = {
							total_count: 1,
							total_reward: 30,
							str_1: [obj_character_wild_dog, 1, [[2, 0]]]
							};
#endregion

#region === ИНИЦИАЛИЗАЦИЯ СТРУКТУР ВРАГОВ - СРЕДНИЙ УРОВЕНЬ - 11 - 16 ===
struct_enemies_11		  = {
							total_count: 3,
							total_reward: 95,
							str_1: [obj_character_bulldog, 2, [[1, 1], [3, 1]]],
							str_2: [obj_character_fox, 1,     [[2, 4]]]
							};
struct_enemies_12		  = {
							total_count: 4,
							total_reward: 115,
							str_1: [obj_character_pig, 4, [[2, 0], [0, 2], [4, 2], [2, 4]]]
							};
struct_enemies_13		  = {
							total_count: 3,
							total_reward: 95,
							str_1: [obj_character_cat, 3, [[1, 2], [3, 2], [2, 1]]]
							};
struct_enemies_14		  = {
							total_count: 3,
							total_reward: 95,
							str_1: [obj_character_dragonfly, 1, [[0, 1]]],
							str_2: [obj_character_bug, 1, [[2, 4]]],
							str_3: [obj_character_mantis, 1, [[4, 1]]]
							};
struct_enemies_15		  = {
							total_count: 3,
							total_reward: 95,
							str_1: [obj_character_rabbit, 2, [[0, 3], [4, 3]]],
							str_2: [obj_character_cat, 1, [[2, 4]]]
							};
struct_enemies_16		  = {
							total_count: 4,
							total_reward: 115,
							str_1: [obj_character_wild_dog, 1, [[2, 1]]],
							str_2: [obj_character_wild_puppy, 1, [[3, 1]]],
							str_3: [obj_character_bulldog, 1, [[1, 1]]],
							str_4: [obj_character_dragonfly, 1, [[0, 2]]]
							};
#endregion

#region === ИНИЦИАЛИЗАЦИЯ СТРУКТУР ВРАГОВ - СЛОЖНЫЙ УРОВЕНЬ - 17 - 19 ===
struct_enemies_17		  = {
							total_count: 5,
							total_reward: 175,
							str_1: [obj_character_mantis, 2, [[1, 1], [3, 1]]],
							str_2: [obj_character_cat, 2, [[1, 3], [3, 3]]],
							str_3: [obj_character_pig, 1, [[2, 2]]],
							};
struct_enemies_18		  = {
							total_count: 5,
							total_reward: 175,
							str_1: [obj_character_rabbit, 3, [[1, 1], [3, 1], [2, 4]]],
							str_2: [obj_character_wild_puppy, 2, [[0, 2], [4, 2]]]
							};
struct_enemies_19		  = {
							total_count: 5,
							total_reward: 195,
							str_1: [obj_character_cat, 1, [[1, 1]]],
							str_2: [obj_character_fox, 1, [[2, 2]]],
							str_3: [obj_character_bug, 1, [[3, 1]]],
							str_4: [obj_character_pig, 1, [[0, 3]]],
							str_5: [obj_character_wild_puppy, 1, [[4, 4]]],
							};
#endregion

#region === ИНИЦИАЛИЗАЦИЯ СТРУКТУР ВРАГОВ - БОССЫ - 20 - 22 ===
struct_enemies_20		  = {
							total_count: 3,
							total_reward: 220,
							str_1: [obj_character_forest_spirit, 1, [[2, 1]]],
							str_2: [obj_character_dragonfly, 2, [[3, 0], [1, 0]]]
							}
struct_enemies_21		  = {
							total_count: 5,
							total_reward: 220,
							str_1: [obj_character_dryad, 1, [[2, 1]]],
							str_2: [obj_character_rabbit, 4, [[1, 0], [0, 1], [3, 0], [4, 1]]]
							}
struct_enemies_22		  = {
							total_count: 3,
							total_reward: 220,
							str_1: [obj_character_leshy, 1, [[2, 1]]],
							str_2: [obj_character_wild_dog, 2, [[1, 2], [3, 2]]]
							}
#endregion

if (obj_manager_main.current_wave + 1 == 24) { total_chosen_struct = 20; total_chosen_env_struct = 4;}
else {
	if (obj_manager_main.current_wave + 1 == 48) total_chosen_struct = 21;
	else {
		if (obj_manager_main.current_wave + 1 == 72) total_chosen_struct = 22;
		else {
			if ((obj_manager_main.current_wave + 1) mod 4 == 0) { total_chosen_struct = 0; total_chosen_env_struct = 0; }
			else {
				var _pos = obj_manager_main.current_wave + 1;
				if (_pos >= 1 && _pos <= 9)   total_chosen_struct = irandom_range(1, 10);
				if (_pos >= 10 && _pos <= 24) total_chosen_struct = irandom_range(11, 16);
				if (_pos > 24)                total_chosen_struct = irandom_range(11, 19);
			}
		}
	}
}
if ((obj_manager_main.current_wave + 1) mod 24 == 0) {
	obj_manager_main.multiplier += 0.5;
}
if (instance_exists(obj_tooltip_education)) {
	if (global.FirstPlayCheck && obj_tooltip_education.step_of_eductation < 9) total_chosen_struct = 1;
}

//total_chosen_struct = 10;
//total_chosen_env_struct = 4;

chosen_struct             = variable_instance_get(id, "struct_enemies_" + string(total_chosen_struct));
chosen_env_struct         = variable_instance_get(id, "struct_env_" + string(total_chosen_env_struct));
total_count_enemies       = chosen_struct.total_count;

#region === ИНИЦИАЛИЗАЦИЯ ВРАГОВ ИЗ СТРУКТУРЫ ===
function place_enemy_on_grid(object_type, desired_grid_x, desired_grid_y) {
    var manager = obj_manager_map;
    var enemy = instance_create_layer(0, 0, "Characters", object_type);
    
    enemy.grid_x = desired_grid_x;
    enemy.grid_y = desired_grid_y;
    
    var slot_found = false;
    var target_slot = noone;
    
    with (obj_slot_map) {
        if (grid_x == desired_grid_x && grid_y == desired_grid_y) {
            slot_found = true;
            target_slot = id;
            break;
        }
    }
    
    if (slot_found) {
        if (!target_slot.is_occupied) {
            target_slot.is_occupied = true;
        } else {
            var neighbor_offsets = [
                [1, 0], [-1, 0], [0, 1], [0, -1]
            ];
            
            var found_neighbor = false;
            for (var i = 0; i < array_length(neighbor_offsets); i++) {
                var nx = desired_grid_x + neighbor_offsets[i][0];
                var ny = desired_grid_y + neighbor_offsets[i][1];
                
                if (nx >= manager.grid_width) nx = 0;
                else if (nx < 0) nx = manager.grid_width - 1;
                if (ny >= manager.grid_height) ny = 0;
                else if (ny < 0) ny = manager.grid_height - 1;
                
                var neighbor_slot = noone;
                with (obj_slot_map) {
                    if (grid_x == nx && grid_y == ny && !is_occupied) {
                        neighbor_slot = id;
                        break;
                    }
                }
                
                if (neighbor_slot != noone) {
                    neighbor_slot.is_occupied = true;
                    enemy.grid_x = nx;
                    enemy.grid_y = ny;
                    found_neighbor = true;
                    break;
                }
            }
            
            if (!found_neighbor) {
                var free_cells = [];
                with (obj_slot_map) {
                    if (!is_occupied) {
                        array_push(free_cells, [grid_x, grid_y, id]);
                    }
                }
                
                if (array_length(free_cells) > 0) {
                    var random_index = irandom(array_length(free_cells) - 1);
                    var selected_cell = free_cells[random_index];
                    
                    enemy.grid_x = selected_cell[0];
                    enemy.grid_y = selected_cell[1];
                    
                    var selected_slot = selected_cell[2];
                    selected_slot.is_occupied = true;
                } else {
                    instance_destroy(enemy);
                    return noone;
                }
            }
        }
    } else {
        var free_cells = [];
        with (obj_slot_map) {
            if (!is_occupied) {
                array_push(free_cells, [grid_x, grid_y, id]);
            }
        }
        
        if (array_length(free_cells) > 0) {
            var random_index = irandom(array_length(free_cells) - 1);
            var selected_cell = free_cells[random_index];
            
            enemy.grid_x = selected_cell[0];
            enemy.grid_y = selected_cell[1];
            
            var selected_slot = selected_cell[2];
            selected_slot.is_occupied = true;
        } else {
            instance_destroy(enemy);
            return noone;
        }
    }
    
    enemy.target_x = manager.grid_offset_x + enemy.grid_x * manager.cell_size + 10;
    enemy.target_y = manager.grid_offset_y + enemy.grid_y * manager.cell_size - 16;
    enemy.drawing_x = enemy.target_x;
	enemy.x = enemy.target_x;
    enemy.y = enemy.target_y;
	
	enemy.alarm[11] = irandom_range(30, 90);
    
    return enemy;
}

if (total_count_enemies > 0) {
    var manager = obj_manager_map;
    
    if (total_chosen_struct == 0) {
        with (obj_character_main) {
            move_to_cell(manager.player_grid_x, manager.player_grid_y);
        }
    }
    
    var rune_index = irandom(3);
    var rune_position = [0, 0];
    var rune_type = obj_rune_life;
    
    switch (rune_index) {
        case 1: rune_position = [0, manager.grid_height - 1]; break;
        case 2: rune_position = [manager.grid_width - 1, 0]; break;
        case 3: rune_position = [manager.grid_width - 1, manager.grid_height - 1]; break;
    }
    
    if (rune_index >= 2) {
        rune_type = obj_rune_magic;
    }
    
    place_enemy_on_grid(rune_type, rune_position[0], rune_position[1]);
    
    var keys = struct_get_names(chosen_struct);
    for (var i = 0; i < array_length(keys); i++) {
        if (!is_array(chosen_struct[$ keys[i]])) continue;
        
        var enemy_data = chosen_struct[$ keys[i]];
        var enemy_type = enemy_data[0];
        var enemy_count = enemy_data[1];
        var positions = enemy_data[2];
        
        for (var j = 0; j < enemy_count; j++) {
            if (j < array_length(positions)) {
                var pos_x = positions[j][0];
                var pos_y = positions[j][1];
                place_enemy_on_grid(enemy_type, pos_x, pos_y);
            }
        }
    }
    
    var env_keys = struct_get_names(chosen_env_struct);
    for (var i = 0; i < array_length(env_keys); i++) {
        if (!is_array(chosen_env_struct[$ env_keys[i]])) continue;
        
        var enemy_data = chosen_env_struct[$ env_keys[i]];
        var enemy_type = enemy_data[0];
        var enemy_count = enemy_data[1];
        var positions = enemy_data[2];
        
        for (var j = 0; j < enemy_count; j++) {
            if (j < array_length(positions)) {
                var pos_x = positions[j][0];
                var pos_y = positions[j][1];
                place_enemy_on_grid(enemy_type, pos_x, pos_y);
            }
        }
    }
}
#endregion
