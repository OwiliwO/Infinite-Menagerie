/// @description Инициализация


randomize();

#region === ИНИЦИАЛИЗАЦИЯ ВИЗУАЛЬНЫХ ПАРАМЕТРОВ ===
sprite_index              = noone;
sprite_particles          = noone;
image_index               = 0;
image_mask                = 0;
#endregion

#region === ИНИЦИАЛИЗАЦИЯ ОСНОВНЫХ ПАРАМЕТРОВ ===
base_grow_STRENGTH        = 4;
base_grow_AGILITY         = 3;
base_grow_INTELEGENCE     = 2;

statistic_STRENGTH        = 0;
statistic_AGILITY         = 0;
statistic_INTELEGENCE     = 0;
statistic_MAIN_ATTRIBUTE  = "";

statistic_SPEED           = 1;
statistic_SPEED_ATTACK    = statistic_SPEED;
statistic_DAMAGE          = 0;

statistic_MAX_HP          = statistic_STRENGTH * base_grow_STRENGTH div 3;
statistic_OLD_MAX_HP      = statistic_MAX_HP;
statistic_HP              = statistic_MAX_HP;

statistic_MAX_MP          = statistic_INTELEGENCE * base_grow_INTELEGENCE div 3;
statistic_OLD_MAX_MP      = statistic_MAX_MP;
statistic_MP              = statistic_MAX_MP;

statistic_MAX_AP          = base_grow_AGILITY * base_grow_AGILITY div 7;
statistic_OLD_MAX_AP      = statistic_MAX_AP;
statistic_AP              = statistic_MAX_AP;

statistic_OLD_HP          = statistic_HP;

inventory_slots           = [];
selected_item             = noone;
#endregion

#region === ИНИЦИАЛИЗАЦИЯ ФЛАГОВ ДЕЙСТВИЙ ===
is_have_fallen            = false;
is_falling                = false;
is_active_turn            = false;
is_moving                 = false;
is_dust_moving            = false;
is_magic_attacking        = false;
is_shaking                = false;
is_attacking              = false;
is_reverse_attacking      = false;
is_blend                  = false;
is_double_life            = false;
#endregion

#region === ИНИЦИАЛИЗАЦИЯ БАФФОВ НА ДЕЙСТВИЯ ===
is_buff_bleeding          = false;
is_buff_double_turn       = false;
is_buff_splash            = false;
is_buff_disarm            = false;
is_buff_root              = false;
is_buff_lunge_attack      = false;
is_buff_teleport_turn     = false;
is_buff_immortality       = false;
is_buff_shadow            = false;
is_buff_rage              = false;
percent_buff_immortality  = 25;
is_buff_revenge           = false;
target_revenge            = noone;
is_buff_dodge             = false;
target_dodge              = noone;
percent_buff_crit         = 0;
add_damage                = 0;

is_update_statistic       = false;
#endregion

#region === ИНИЦИАЛИЗАЦИЯ ДЕБАФФОВ НА ДЕЙСТВИЯ ===
is_debuff_disarm          = false;
is_debuff_root            = false;
#endregion

#region === ИНИЦИАЛИЗАЦИЯ ПОЗИЦИОНИРОВАНИЯ ===
grid_x                    = 0;
grid_y                    = 0;
target_x                  = 0;
target_y                  = 0;
start_x                   = 0;
start_y                   = 0;
attack_target_x           = 0;
attack_target_y           = 0;
drawing_x                 = 0;
drawing_y                 = 0;
#endregion

#region === ИНИЦИАЛИЗАЦИЯ ДОСТУПНЫХ КЛЕТОК ===
reachable_move_cells      = [];
reachable_attack_cells    = [];
#endregion

#region === ДОПОЛНИТЕЛЬНЫЕ ПЕРЕМЕННЫЕ ===
move_speed                = 0.5;
attack_speed              = move_speed * 1.5;
attack_return_speed       = move_speed / 4;
idle_time                 = 0;
idle_radius               = 3;
idle_speed                = 4;
shake_intensity           = 0;
shake_duration            = 0;
shake_max_intensity       = 7;
shake_speed               = 0.1;
shake_offset_x            = 0;
shake_offset_y            = 0;
blend_alpha               = 0;
idle_transition_start_x   = 0;
idle_transition_start_y   = 0;
idle_transition_progress  = 0;
#endregion

#region === ОСНОВНЫЕ ФУНКЦИИ ОБЪЕКТОВ ===
function start_shake(dur, int) {
    shake_flag = true;
    shake_duration = dur;
    shake_intensity = int;
}
function process_splash_damage(center_x, center_y, base_damage, manager) {
    var splash_damage = base_damage div 2;
    var splash_directions = [
        [1, 0],
        [-1, 0],
        [0, 1],
        [0, -1],
        [1, 1],
        [1, -1],
        [-1, 1],
        [-1, -1]
    ];
    
    for (var i = 0; i < array_length(splash_directions); i++) {
        var dir = splash_directions[i];
        var splash_x = center_x + dir[0];
        var splash_y = center_y + dir[1];
        
        if (splash_x >= 0 && splash_x < manager.grid_width && 
            splash_y >= 0 && splash_y < manager.grid_height) {
            
            var splash_occupied = false;
            var splash_occupying_id = noone;
            
            with (obj_slot_map) {
                if (grid_x == splash_x && grid_y == splash_y) {
                    splash_occupied = is_occupied;
                    splash_occupying_id = occupying_object;
                    break;
                }
            }
            
            if (splash_occupied && splash_occupying_id != id) {
                if (instance_exists(obj_parent_characters_allies)) {
					if (splash_occupying_id == obj_parent_characters_allies.id) return;
				}
				splash_occupying_id.statistic_HP -= splash_damage;
                
                src_clue(splash_occupying_id, splash_damage, "Splash", c_gray);
                with (splash_occupying_id) {
                    start_shake(5, 1);
                }
                
                if (splash_occupying_id.statistic_HP <= 0) {
                    with(splash_occupying_id) instance_destroy();
                }
            }
        }
    }
}

function move_to_cell() {
    var manager = obj_manager_map;
    
    if (argument0 >= 0 && argument0 < manager.grid_width && 
        argument1 >= 0 && argument1 < manager.grid_height) {
        
        var target_cell_occupied = false;
        with (obj_slot_map) {
            if (grid_x == argument0 && grid_y == argument1) {
                target_cell_occupied = is_occupied;
                break;
            }
        }
        
        if (!target_cell_occupied) {
            with (obj_slot_map) {
                if (grid_x == other.grid_x && grid_y == other.grid_y) {
                    is_occupied = false;
                    occupying_object = noone;
                }
            }
            
            grid_x = argument0;
            grid_y = argument1;
            
            with (obj_slot_map) {
                if (grid_x == other.grid_x && grid_y == other.grid_y) {
                    is_occupied = true;
                    occupying_object = other.id;
                }
            }
            
            target_x = manager.grid_offset_x + grid_x * manager.cell_size + 10;
            target_y = manager.grid_offset_y + grid_y * manager.cell_size - 16;
			x = target_x;
			y = target_y;
            
            is_moving = true;
            
            return true;
        } else {
            return false;
        }
    } else {
        return false;
    }
}
function move_to_random() {
    if (!instance_exists(argument0)) return;
	
	if (is_debuff_root) return;
    
    var available_cells = reachable_move_cells;
    var best_cell = [-1, -1];
    var best_distance = 9999;
    
    for (var i = 0; i < array_length(available_cells); i++) {
        var cell = available_cells[i];
        var dist = point_distance(cell[0], cell[1], argument0.grid_x, argument0.grid_y);
        
        if (dist < best_distance) {
            best_distance = dist;
            best_cell = cell;
        }
    }
    
    if (best_cell[0] != -1 && best_cell[1] != -1) {
        if (move_to_cell(best_cell[0], best_cell[1])) {
			return true;
        }
    }
	
	return false;
}

function attack_melee_to_cell() {
	var target = noone;
    with (obj_slot_map) {
        if (grid_x == argument0 && grid_y == argument1 && is_occupied) {
            target = occupying_object;
            break;
        }
    }
    
    if (!instance_exists(target)) return false;

    var damage = statistic_DAMAGE;
	if (percent_buff_crit > 75) percent_buff_crit = 75;
	if (scr_percent(percent_buff_crit)) damage *= 2;
    target.statistic_HP -= damage;

    start_x = drawing_x;
    start_y = drawing_y;
    attack_target_x = target.drawing_x;
    attack_target_y = target.drawing_y;
    if (global.TypeAbility == "Regular_Attack" || global.TypeAbility == "None") is_attacking = true;

    with (obj_manager_main) camera_shake(4, 12);
    with (target) {
        start_shake(8, 2);
    }
    
    var _color = c_white;
    if (damage < 10) _color = make_color_rgb(0, 0, 0);;
    if (damage >= 10 && damage < 20) _color = make_color_rgb(255, 165, 0);
	if (damage >= 20) _color = make_color_rgb(255, 0, 0);
    src_clue(target, damage, global.DescHP, _color);

    if (target.statistic_HP <= 0 && !target.is_double_life) {
		obj_character_main.last_hit = object_index;
		with(target) instance_destroy();
    }

    return true;
}
function attack_lunge_to_cell() {
	var target = noone;
    with (obj_slot_map) {
        if (grid_x == argument0 && grid_y == argument1 && is_occupied) {
            target = occupying_object;
            break;
        }
    }
    
    if (!instance_exists(target)) return false;
    
    var manager = obj_manager_map;
    
    var dir_x = sign(target.grid_x - grid_x);
    var dir_y = sign(target.grid_y - grid_y);
    
    var lunge_x = grid_x + (dir_x * 2);
    var lunge_y = grid_y + (dir_y * 2);
    
    lunge_x = clamp(lunge_x, 0, manager.grid_width - 1);
    lunge_y = clamp(lunge_y, 0, manager.grid_height - 1);
    
    var lunge_cell_free = false;
    with (obj_slot_map) {
        if (grid_x == lunge_x && grid_y == lunge_y) {
            lunge_cell_free = !is_occupied;
            break;
        }
    }
    
    if (!lunge_cell_free) {
        var alt_x = grid_x + dir_x;
        var alt_y = grid_y + dir_y;
        
        if (alt_x >= 0 && alt_x < manager.grid_width && 
            alt_y >= 0 && alt_y < manager.grid_height) {
            
            with (obj_slot_map) {
                if (grid_x == alt_x && grid_y == alt_y) {
                    lunge_cell_free = !is_occupied;
                    break;
                }
            }
            
            if (lunge_cell_free) {
                lunge_x = alt_x;
                lunge_y = alt_y;
            }
        }
    }
    
    if (lunge_cell_free) {
        with (obj_slot_map) {
            if (grid_x == other.grid_x && grid_y == other.grid_y) {
                is_occupied = false;
                occupying_object = noone;
            }
        }
        
        grid_x = lunge_x;
        grid_y = lunge_y;
        
        with (obj_slot_map) {
            if (grid_x == other.grid_x && grid_y == other.grid_y) {
                is_occupied = true;
                occupying_object = other.id;
            }
        }
        
        target_x = manager.grid_offset_x + grid_x * manager.cell_size + 10;
        target_y = manager.grid_offset_y + grid_y * manager.cell_size - 16;
        x = target_x;
        y = target_y;
        drawing_x = target_x;
        drawing_y = target_y;
        
		var _target_in_range = false;
    
	    var dx = abs(grid_x - target.grid_x);
	    var dy = abs(grid_y - target.grid_y);
    
	    _target_in_range = (dx <= statistic_SPEED_ATTACK && dy <= statistic_SPEED_ATTACK);
		
        if (_target_in_range) {
            var damage = statistic_DAMAGE;
			if (percent_buff_crit > 75) percent_buff_crit = 75;
			if (scr_percent(percent_buff_crit)) damage *= 2;
			target.statistic_HP -= damage;
            
			with (obj_manager_main) camera_shake(12, 20);
			with (target.id) {
				start_shake(10, 3);
			}
			var _color = c_white;
		    if (damage < 10) _color = make_color_rgb(0, 0, 0);;
		    if (damage >= 10 && damage < 20) _color = make_color_rgb(255, 165, 0);
			if (damage >= 20) _color = make_color_rgb(255, 0, 0);
			src_clue(target.id, damage, global.DescHP, _color);
            
            var behind_dir_x = sign(target.grid_x - grid_x);
            var behind_dir_y = sign(target.grid_y - grid_y);
            var behind_x = target.grid_x + behind_dir_x;
            var behind_y = target.grid_y + behind_dir_y;
            
            var behind_free = false;
            if (behind_x >= 0 && behind_x < manager.grid_width && 
                behind_y >= 0 && behind_y < manager.grid_height) {
                
                with (obj_slot_map) {
                    if (grid_x == behind_x && grid_y == behind_y) {
                        behind_free = !is_occupied;
                        break;
                    }
                }
            }
            
            if (behind_free) {
                move_to_cell(behind_x, behind_y);
            } else {
			    var free_cells = [];
    
			    for (var dx = -statistic_SPEED; dx <= statistic_SPEED; dx++) {
			        for (var dy = -statistic_SPEED; dy <= statistic_SPEED; dy++) {
			            if (dx == 0 && dy == 0) continue;
            
			            var check_x = target.grid_x + dx;
			            var check_y = target.grid_y + dy;
            
			            if (check_x < 0 || check_x >= manager.grid_width || 
			                check_y < 0 || check_y >= manager.grid_height) continue;
            
			            var cell_occupied = false;
			            with (obj_slot_map) {
			                if (grid_x == check_x && grid_y == check_y) {
			                    cell_occupied = is_occupied;
			                    break;
			                }
			            }
            
			            if (!cell_occupied) {
			                array_push(free_cells, [check_x, check_y]);
			            }
			        }
			    }

                if (array_length(free_cells) > 0) {
                    var random_cell = free_cells[irandom(array_length(free_cells) - 1)];
                    move_to_cell(random_cell[0], random_cell[1]);
                }
            }
        }
		
		if (target.statistic_HP <= 0 && !target.is_double_life) {
			obj_character_main.last_hit = object_index;
			with(target) instance_destroy();
	    }
        
        return true;
    }
    
    return false;
}
function change_mask_to_cell() {
	var target = noone;
    with (obj_slot_map) {
        if (grid_x == argument0 && grid_y == argument1 && is_occupied) {
            target = occupying_object;
            break;
        }
    }
    
    if (!instance_exists(target)) return false;

    image_mask = target.image_mask;
	var _modify_id = id;
	if (image_mask != 0) {
		var _modify = instance_create_layer(0, 0, "UI", obj_modify_mask);
		_modify.modify_id = _modify_id;
	}

    start_x = drawing_x;
    start_y = drawing_y;
    attack_target_x = target.drawing_x;
    attack_target_y = target.drawing_y;
    is_attacking = true;

    with (obj_manager_main) camera_shake(4, 12);
    with (target) {
        start_shake(8, 2);
    }

    return true;
}
function attack_melee_in_directions() {
	if (argument2 <= 0) return false;
	if (argument3 - 1 < 0) return true;

	var _current_direction = false;
    if (check_direction(argument0, argument1, argument2, argument3 - 1)) {
		_current_direction = attack_melee_in_directions(argument0, argument1, argument2, argument3 - 1);
	}
	
	if (_current_direction) return true;
	return false;
}
function check_direction() {
    if (argument2 <= 0) return true;
    var check_x = argument0;
    var check_y = argument1;
    
    switch (argument3) {
        case 0: check_y -= argument2; break; 
        case 1: check_x += argument2; break;
        case 2: check_y += argument2; break;
        case 3: check_x -= argument2; break;
		case 4: check_x += argument2; check_y -= argument2; break;
		case 5: check_x += argument2; check_y += argument2; break;
		case 6: check_x -= argument2; check_y += argument2; break;
		case 7: check_x -= argument2; check_y -= argument2; break;
    }
    
	var _current_attack = false;
    if (attack_melee_to_cell(check_x, check_y)) {
		if (is_buff_bleeding) src_bleeding_buff(40, check_x, check_y);
		if (is_buff_double_turn) src_double_turn_buff(25);
		if (is_buff_disarm) src_disarm_buff(35, check_x, check_y)
		if (is_buff_root) src_root_buff(60, check_x, check_y);
		if (is_buff_splash) process_splash_damage(check_x, check_y, statistic_DAMAGE, obj_manager_map);
	}
	_current_attack = check_direction(argument0, argument1, argument2 - 1, argument3);
	
	if (_current_attack) return true;
	return false;
}
function create_particles_four_direction() {
	for(var i = 0; i < 4; i++) {
	    with(instance_create_layer(drawing_x + sprite_width / 2, drawing_y + sprite_height / 2, "Instances", argument0)) {
	        direction = i * 90;
        
	        switch(direction) {
	            case 0: image_angle = 270; break;
	            case 90: image_angle = 0; break;
	            case 180: image_angle = 90; break;
	            case 270: image_angle = 180; break;
	        }
	    }
	}
}
function create_particles_eight_direction() {
	for(var i = 0; i < 8; i++) {
	    with(instance_create_layer(drawing_x + sprite_width / 2, drawing_y + sprite_height / 2, "Instances", argument0)) {
	        direction = i * 45;
        
	        switch(direction) {
	            case 0: image_angle = 270; break;
				case 45: image_angle = 315; break;
	            case 90: image_angle = 0; break;
				case 135: image_angle = 45; break;
	            case 180: image_angle = 90; break;
				case 225: image_angle = 135; break;
	            case 270: image_angle = 180; break;
				case 315: image_angle = 225; break;
	        }
	    }
	}
}

function create_allies_turn() {
    var enemy = instance_create_layer(0, 0, "Characters", argument0);

    var original_grid_x = grid_x;
    var original_grid_y = grid_y;
    
    enemy.grid_x = original_grid_x;
    enemy.grid_y = original_grid_y;
    var position_found = false;
    
    var slot_found = false;
    var target_slot = noone;
    
    with (obj_slot_map) {
        if (grid_x == original_grid_x && grid_y == original_grid_y) {
            slot_found = true;
            target_slot = id;
            break;
        }
    }
    
    if (slot_found) {
        if (!target_slot.is_occupied) {
            target_slot.is_occupied = true;
            position_found = true;
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
                
                position_found = true;
            } else {
                instance_destroy(enemy);
                return;
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
            
            position_found = true;
        } else {
            instance_destroy(enemy);
            return;
        }
    }
    
    if (!position_found) {
        instance_destroy(enemy);
        return;
    }
    
    enemy.target_x = obj_manager_map.grid_offset_x + enemy.grid_x * obj_manager_map.cell_size + 10;
    enemy.target_y = obj_manager_map.grid_offset_y + enemy.grid_y * obj_manager_map.cell_size - 16;
    enemy.x = enemy.target_x;
    enemy.y = enemy.target_y;
	enemy.is_have_fallen = true;
	enemy.idle_transition_progress = 1;
    
    if (!argument1) {
        part_particles_create(obj_manager_particle.particleSystem, 
                              enemy.x + sprite_width / 2, 
                              enemy.y + sprite_height / 2, 
                              obj_manager_particle.particleDarkDust, 10);
        part_particles_create(obj_manager_particle.particleSystem, 
                              enemy.x + sprite_width / 2, 
                              enemy.y + sprite_height / 2, 
                              obj_manager_particle.particleDarkSmoke, 20);
    }
    
    if (argument1) {
        obj_manager_wave.total_count_enemies++;
    }
}

function skip_turn() {
	statistic_AP = 0;
}
#endregion