/// @description Инициализация


event_inherited();
var manager = obj_manager_map;

#region === ИНИЦИАЛИЗАЦИЯ ДОПОЛНИТЕЛЬНЫХ ПЕРЕМЕННЫХ ===
description_NAMING        = "Nothing"
description_ALL           = "All description"
description_FEATURE       = "Feature description"
death_phrase              = ""
statistic_INITIATIVE      = 0;

is_my_turn                = false;
target_x                  = manager.grid_offset_x + grid_x * manager.cell_size + 14;
target_y                  = manager.grid_offset_y + grid_y * manager.cell_size - 10;
idle_speed                = 0;
x                         = target_x;
y                         = target_y;
drawing_x                 = x;
drawing_y                 = -100;
statistic_add             = 0;
is_enemy                  = false;
#endregion

#region === ОСНОВНЫЕ ФУНКЦИИ ВРАГОВ ===
function is_player_in_range() {
    if (!instance_exists(argument0)) return false;
    
    var dx = abs(grid_x - argument0.grid_x);
    var dy = abs(grid_y - argument0.grid_y);
    
    return (dx <= argument1 && dy <= argument1);
}
function find_nearest_player() {
    var nearest = noone;
    var min_dist = 10000;
    
    with (obj_character_main) {
        var dist = point_distance(other.grid_x, other.grid_y, grid_x, grid_y);
        if (dist < min_dist) {
            min_dist = dist;
            nearest = id;
        }
    }
    
    return nearest;
}

function move_turn() {
	if (!instance_exists(argument0)) return false;
	
	if (is_debuff_root) return false;
    
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
			statistic_AP--;
        }
    }
	
	return true;
}
function attack_melee_turn() {
	if (!instance_exists(argument0)) return false;
    
    if (!is_player_in_range(argument0, statistic_SPEED_ATTACK)) return false;
	
	if (is_debuff_disarm) return false;

    if (attack_melee_to_cell(argument0.grid_x, argument0.grid_y)) {
        statistic_AP--;
		if (instance_exists(argument0)) argument0.target_revenge = id;
		if (instance_exists(argument0)) argument0.target_dodge = id;
		return true;
    }
    
    return false;
}
function attack_lunge_turn() {
	if (!instance_exists(argument0)) return false;
    
    if (!is_player_in_range(argument0, statistic_SPEED_ATTACK + 1)) return false;
	
	if (is_debuff_disarm) return false;

    if (attack_lunge_to_cell(argument0.grid_x, argument0.grid_y)) {
        statistic_AP--;
		if (instance_exists(argument0)) argument0.target_revenge = id;
		if (instance_exists(argument0)) argument0.target_dodge = id;
        return true;
    }
    
    return false;
}
function end_turn() {
    is_my_turn = false;
	is_active_turn = false;
	is_blend = false;
    with (obj_manager_main) {
        current_enemies--;
		current_actor = noone;
		is_step_enemies = false;
    }
    
	statistic_AP = statistic_MAX_AP;
}
#endregion