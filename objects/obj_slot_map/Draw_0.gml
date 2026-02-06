/// @description Визуализация


var _manager = obj_manager_map;
var _player = obj_character_main;
var _is_reachable = false;
var _is_reachable_attacking = false;

draw_self();

if (!_player.is_moving) {
    for (var i = 0; i < array_length(_player.reachable_move_cells); i++) {
        var _cell = _player.reachable_move_cells[i];
        if (_cell[0] == grid_x && _cell[1] == grid_y) {
            _is_reachable = true;
            break;
        }
    }
}
if (!_player.is_attacking) {
	for (var i = 0; i < array_length(_player.reachable_attack_cells); i++) {
        var _cell = _player.reachable_attack_cells[i];
        if (_cell[0] == grid_x && _cell[1] == grid_y) {
            _is_reachable_attacking = true;
            break;
        }
    }
}
if ((_is_reachable && global.TypeAbility == "Regular_Move" && !is_occupied) ||
	(_is_reachable_attacking && (global.TypeAbility == "Regular_Attack" || global.TypeAbility == "Change_Mask") && is_occupied)){
	image_index = 1;
	if (position_meeting(mouse_x, mouse_y, id)) image_index = 2;
} else image_index = current_image_index;
