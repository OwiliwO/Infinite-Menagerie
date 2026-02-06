/// @description Итерация


var manager = obj_manager_map;

#region === ИТЕРАЦИЯ УДЕРЖАНИЯ СТАТИСТИЧЕСКИХ ДАННЫХ ===
statistic_MAX_HP = round(statistic_STRENGTH * base_grow_STRENGTH / 3);
statistic_MAX_MP = round(statistic_INTELEGENCE * base_grow_INTELEGENCE / 3);
statistic_MAX_AP = round(statistic_AGILITY * base_grow_AGILITY / 7);
statistic_SPEED  = round(statistic_INTELEGENCE * base_grow_INTELEGENCE / 8);
statistic_SPEED_ATTACK = statistic_SPEED;
if (statistic_MAIN_ATTRIBUTE == "STRENGTH")    statistic_DAMAGE = round(statistic_STRENGTH * base_grow_STRENGTH / 6) + add_damage;
if (statistic_MAIN_ATTRIBUTE == "INTELEGENCE") statistic_DAMAGE = round(statistic_INTELEGENCE * base_grow_INTELEGENCE / 6) + add_damage;
if (statistic_MAIN_ATTRIBUTE == "AGILITY")     statistic_DAMAGE = round(statistic_AGILITY * base_grow_AGILITY / 6) + add_damage;
if (statistic_MP < 0) statistic_MP = 0;
if (statistic_AP < 0) statistic_AP = 0;
if (statistic_STRENGTH < 2) statistic_STRENGTH = 2;
if (statistic_INTELEGENCE < 2) statistic_INTELEGENCE = 2;
if (statistic_AGILITY < 2) statistic_AGILITY = 2;
#endregion

#region === ИТЕРАЦИЯ ТРЯСКИ ОБЪЕКТА ===
if (is_shaking) {
    shake_duration--;
    
    if (shake_duration > 0) {
        if (shake_duration > 15) {
            shake_intensity = min(shake_intensity + shake_speed, shake_max_intensity);
        } else {
            shake_intensity = max(shake_intensity - shake_speed, 0);
        }
        
        shake_offset_x = random_range(-shake_intensity, shake_intensity);
        shake_offset_y = random_range(-shake_intensity, shake_intensity);
    } else {
        is_shaking = false;
        shake_intensity = 0;
        shake_offset_x = 0;
        shake_offset_y = 0;
    }
}
#endregion

#region === ИТЕРАЦИЯ ДОСТУПНЫХ КЛЕТОК ===
if (!is_moving) {
    reachable_move_cells = [];
    
    for (var dx = -statistic_SPEED; dx <= statistic_SPEED; dx++) {
        for (var dy = -statistic_SPEED; dy <= statistic_SPEED; dy++) {
            if (dx == 0 && dy == 0) continue;
            
            var new_x = grid_x + dx;
            var new_y = grid_y + dy;
            
            if (new_x >= 0 && new_x < manager.grid_width && 
                new_y >= 0 && new_y < manager.grid_height) {
                
                var cell_found = false;
                with (obj_slot_map) {
                    if (grid_x == new_x && grid_y == new_y) {
                        if (!is_occupied) {
                            array_push(other.reachable_move_cells, [new_x, new_y]);
                        }
                    }
                }
            }
        }
    }
} else {
    reachable_move_cells = [];
}
if (!is_attacking) {
    reachable_attack_cells = [];
    
	var _spd = statistic_SPEED_ATTACK;
	if (is_buff_lunge_attack) _spd += 1;
	
    for (var dx = -_spd; dx <= _spd; dx++) {
        for (var dy = -_spd; dy <= _spd; dy++) {
            if (dx == 0 && dy == 0) continue;
            
            var new_x = grid_x + dx;
            var new_y = grid_y + dy;
            
            if (new_x >= 0 && new_x < manager.grid_width && 
                new_y >= 0 && new_y < manager.grid_height) {
                
                var cell_found = false;
                with (obj_slot_map) {
                    if (grid_x == new_x && grid_y == new_y) {
                        if (is_occupied) {
                            array_push(other.reachable_attack_cells, [new_x, new_y]);
                        }
                    }
                }
            }
        }
    }
} else {
    reachable_attack_cells = [];
}
#endregion

#region === ИТЕРАЦИЯ МИГАНИЯ ОБЪЕКТА ===
if (is_blend) {
	blend_alpha += 0.05;
	if (blend_alpha >= 1) blend_alpha = 0;
} else blend_alpha = 0;
#endregion

#region === ИТЕРАЦИЯ ПЕРЕМЕЩЕНИЯ ОБЪЕКТА ===
if (is_dust_moving) {
	part_particles_create(obj_manager_particle.particleSystem, 
							drawing_x + sprite_width / 2, 
							drawing_y + sprite_height - 10, 
							obj_manager_particle.particleSmoke, 6);
	part_particles_create(obj_manager_particle.particleSystem, 
							drawing_x + sprite_width / 2, 
							drawing_y + sprite_height - 10, 
							obj_manager_particle.particleDust, 2);
}
if (is_magic_attacking) {
	part_particles_create(obj_manager_particle.particleSystem, 
							drawing_x + sprite_width / 2, 
							drawing_y + sprite_height - 10, 
							obj_manager_particle.particleMagic, 10);
}
if (is_moving && is_active_turn) {
	is_dust_moving = true;
	drawing_x = lerp(drawing_x, target_x, move_speed);
	drawing_y = lerp(drawing_y, target_y, move_speed);
	
	if (abs(drawing_x - target_x) < 0.5 && abs(drawing_y - target_y) < 0.5) {
	    x = target_x;
	    y = target_y;
	    is_moving = false;
		is_dust_moving = false;
	}
} else {
	if (is_attacking && is_active_turn) {
		if (!is_reverse_attacking) {
			is_magic_attacking = true;
			drawing_x = lerp(drawing_x, attack_target_x, attack_speed);
			drawing_y = lerp(drawing_y, attack_target_y, attack_speed);
	
			if (abs(drawing_x - attack_target_x) < 0.5 && abs(drawing_y - attack_target_y) < 0.5) {
				is_reverse_attacking = true;
				is_magic_attacking = false;
			}
		} else {
			drawing_x = lerp(drawing_x, start_x, attack_return_speed);
			drawing_y = lerp(drawing_y, start_y, attack_return_speed);
			
			if (abs(drawing_x - start_x) < 0.5 && abs(drawing_y - start_y) < 0.5) {
			    drawing_x = start_x;
			    drawing_y = start_y;
			    is_attacking = false;
				is_reverse_attacking = false;
			}
		}
	} else {
		if (is_falling) {
			drawing_y = lerp(drawing_y, target_y, move_speed / 4);
	
			if (abs(drawing_y - target_y) < 0.5) {
				is_falling = false;
				is_have_fallen = true;
				
				idle_transition_start_x = drawing_x;
		        idle_transition_start_y = drawing_y;
		        idle_transition_progress = 0;
			}
		} else {
			if (is_have_fallen) {
				if (idle_transition_progress < 1) {
		            idle_transition_progress += move_speed / 4;
            
		            var target_offset_x = cos(idle_time) * idle_radius;
		            var target_offset_y = sin(idle_time) * idle_radius;
            
		            drawing_x = lerp(idle_transition_start_x, target_x + target_offset_x, idle_transition_progress);
		            drawing_y = lerp(idle_transition_start_y, target_y + target_offset_y, idle_transition_progress);
            
		            idle_time += idle_speed / 100 * idle_transition_progress;
		        } else {
		            idle_time += idle_speed / 100;
		            var offset_x = cos(idle_time) * idle_radius;
		            var offset_y = sin(idle_time) * idle_radius;
            
		            drawing_x = target_x + offset_x;
		            drawing_y = target_y + offset_y;
		        }
			}
		}
	}
}
#endregion

#region === ИТЕРАЦИЯ ПОЛОЖЕНИЯ ОБЪЕКТА ===
with (obj_slot_map) {
	if (grid_x == other.grid_x && grid_y == other.grid_y) {
		is_occupied = true;
		occupying_object = other.id;
	}
}
#endregion