/// @description Итерация


event_inherited();

var manager = obj_manager_map;


#region === ИТЕРАЦИЯ НА ПОБЕДУ ===
if (instance_exists(obj_manager_main)) {
	if (obj_manager_main.current_wave + 1 > 72) {
		instance_destroy();
	}
}
#endregion

#region === ИТЕРАЦИЯ АКТИВАЦИИ / ДЕАКТИВАЦИИ ОБЪЕКТА ===
if (!global.SlideSide && mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id)) {
	is_active_turn = true;
	is_blend = true;
}
if (mouse_check_button_pressed(mb_right)) {
	global.TypeAbility = "None";
	is_active_turn = false;
	is_blend = false;
}
#endregion

#region === ИТЕРАЦИЯ ДЕЙСТВИЙ ОБЪЕКТА ===
if (!global.SlideSide && statistic_AP > 0) {
	target_x = manager.grid_offset_x + grid_x * manager.cell_size + 8;
	target_y = manager.grid_offset_y + grid_y * manager.cell_size - 20;
	x = target_x;
	y = target_y;
	
	if (global.TypeAbility == "Regular_Move" && !is_debuff_root) {
		if (mouse_check_button_pressed(mb_left) && is_active_turn && !is_moving && !is_attacking && !position_meeting(mouse_x, mouse_y, id)) {
			var mouse_grid_x = (mouse_x - manager.grid_offset_x) div manager.cell_size;
		    var mouse_grid_y = (mouse_y - manager.grid_offset_y) div manager.cell_size;
			
			if (mouse_grid_x >= 0 && mouse_grid_x < manager.grid_width && mouse_grid_y >= 0 && mouse_grid_y < manager.grid_height) {
				if (abs(mouse_grid_x - grid_x) <= statistic_SPEED && abs(mouse_grid_y - grid_y) <= statistic_SPEED) {
					if (move_to_cell(mouse_grid_x, mouse_grid_y)) {
						statistic_AP -= 1;
						global.TypeAbility = "None";
					}
				}
			}
		}
	}
	if (global.TypeAbility == "Regular_Attack" && !is_debuff_disarm) {
		if (mouse_check_button_pressed(mb_left) && is_active_turn && !is_moving && !is_attacking && !position_meeting(mouse_x, mouse_y, id)) {
			var mouse_grid_x = (mouse_x - manager.grid_offset_x) div manager.cell_size;
		    var mouse_grid_y = (mouse_y - manager.grid_offset_y) div manager.cell_size;
			var _is_attack = false;
			
			if (mouse_grid_x >= 0 && mouse_grid_x < manager.grid_width && mouse_grid_y >= 0 && mouse_grid_y < manager.grid_height) {
				if (abs(mouse_grid_x - grid_x) == statistic_SPEED_ATTACK + 1 || abs(mouse_grid_y - grid_y) == statistic_SPEED_ATTACK + 1) {
					if (is_buff_lunge_attack) {
						_is_attack = attack_lunge_to_cell(mouse_grid_x, mouse_grid_y);
						if (!_is_attack) _is_attack = attack_melee_to_cell(mouse_grid_x, mouse_grid_y);
						if (_is_attack) {
							if (is_buff_bleeding)      src_bleeding_buff(40, mouse_grid_x, mouse_grid_y);
							if (is_buff_double_turn)   src_double_turn_buff(25);
							if (is_buff_disarm)        src_disarm_buff(35, mouse_grid_x, mouse_grid_y)
							if (is_buff_root)          src_root_buff(60, mouse_grid_x, mouse_grid_y);
							if (is_buff_splash)        process_splash_damage(mouse_grid_x, mouse_grid_y, statistic_DAMAGE, manager);
							statistic_AP -= 1;
							global.TypeAbility = "None";
						}
					}
				}
				
				if (abs(mouse_grid_x - grid_x) <= statistic_SPEED_ATTACK && abs(mouse_grid_y - grid_y) <= statistic_SPEED_ATTACK) {
					_is_attack = attack_melee_to_cell(mouse_grid_x, mouse_grid_y);
					if (_is_attack) {
						if (is_buff_bleeding)       src_bleeding_buff(40, mouse_grid_x, mouse_grid_y);
						if (is_buff_double_turn)    src_double_turn_buff(25);
						if (is_buff_disarm)         src_disarm_buff(35, mouse_grid_x, mouse_grid_y)
						if (is_buff_root)           src_root_buff(60, mouse_grid_x, mouse_grid_y);
						if (is_buff_splash)         process_splash_damage(mouse_grid_x, mouse_grid_y, statistic_DAMAGE, manager);
						statistic_AP -= 1;
						global.TypeAbility = "None";
					}
				}
			}
		}
	}
	if (global.TypeAbility == "Regular_Attack_Four_Direction" && !is_debuff_disarm) {
		if (attack_melee_in_directions(grid_x, grid_y, statistic_SPEED_ATTACK, 4)) {
			create_particles_four_direction(obj_particle_claymore);
			statistic_AP -= 1;
		}
		global.TypeAbility = "None";
	}
	if (global.TypeAbility == "Regular_Attack_Eight_Direction" && !is_debuff_disarm) {
		if (attack_melee_in_directions(grid_x, grid_y, statistic_SPEED_ATTACK, 8)) {
			create_particles_eight_direction(obj_particle_aglegor);
			statistic_AP -= 1;
		}
		global.TypeAbility = "None";
	}
	if (global.TypeAbility == "Skip_Turn") {
		skip_turn();
		global.TypeAbility = "None";
	}
	if (global.TypeAbility == "Change_Mask" && is_ability_mask && statistic_MP >= 2 && !instance_exists(obj_modify_mask)) {
		if (mouse_check_button_pressed(mb_left) && is_active_turn && !is_moving && !is_attacking && !position_meeting(mouse_x, mouse_y, id)) {
			var mouse_grid_x = (mouse_x - manager.grid_offset_x) div manager.cell_size;
		    var mouse_grid_y = (mouse_y - manager.grid_offset_y) div manager.cell_size;
			
			if (mouse_grid_x >= 0 && mouse_grid_x < manager.grid_width && mouse_grid_y >= 0 && mouse_grid_y < manager.grid_height) {
				if (abs(mouse_grid_x - grid_x) <= statistic_SPEED_ATTACK && abs(mouse_grid_y - grid_y) <= statistic_SPEED_ATTACK) {
					if (change_mask_to_cell(mouse_grid_x, mouse_grid_y)) {
						statistic_MP -= 2;
						global.TypeAbility = "None";
					}
				}
			}
		}
	}
}
#endregion

#region === ИТЕРАЦИЯ ДЕЙСТВИЙ ЭФФЕКТА ===
if (statistic_OLD_HP != statistic_HP && is_update_statistic) {
	if (is_buff_dodge) {
		if (target_dodge != noone) src_dodge_buff(45, statistic_OLD_HP);
	}
	if (is_buff_revenge) {
		var count_dmg = 4;
		if (image_mask == 1 && instance_exists(obj_stout_shield)) {
			if (obj_stout_shield.is_owned) count_dmg = 2;
		}
		var _revenge_damage = abs(statistic_HP - statistic_OLD_HP) div count_dmg;
		if (_revenge_damage < 1) _revenge_damage = 1;
		if (target_revenge != noone) if (instance_exists(target_revenge)) src_revenge_buff(40, target_revenge.grid_x, target_revenge.grid_y, _revenge_damage);
		target_revenge = noone;
	}
	if (is_buff_immortality) {
		if (scr_percent(percent_buff_immortality)) statistic_HP = statistic_OLD_HP;
	}
	statistic_OLD_HP = statistic_HP;
}
if (statistic_AP <= 0 && is_buff_shadow) {
	create_allies_turn(obj_character_shadow, false);
}
#endregion

#region === ИТЕРАЦИЯ С ИНВЕНТАРЕМ ===
if (is_active_turn) {
	if (keyboard_check_pressed(ord(obj_manager_controls.quick_cast_item_1))) use_item_from_slot(0);
	if (keyboard_check_pressed(ord(obj_manager_controls.quick_cast_item_2))) use_item_from_slot(1);
	if (keyboard_check_pressed(ord(obj_manager_controls.quick_cast_item_3))) use_item_from_slot(2);
	if (keyboard_check_pressed(ord(obj_manager_controls.quick_cast_item_4))) use_item_from_slot(3);
	if (keyboard_check_pressed(ord(obj_manager_controls.quick_cast_item_5))) use_item_from_slot(4);
	if (keyboard_check_pressed(ord(obj_manager_controls.quick_cast_item_6))) use_item_from_slot(5);
}
#endregion