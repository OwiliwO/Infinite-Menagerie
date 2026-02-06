/// @description Процесс игры


#region === ПРОЦЕСС СОЗДАНИЯ ВРАГОВ ===
if (current_wave == global.CountWaves && !is_create_enemies && instance_exists(obj_character_main)) {
	var _enemies = instance_create_depth(0, 0, -1000, obj_manager_wave);
	current_reward = obj_manager_wave.chosen_struct.total_reward;
	
	is_create_enemies = true;
	is_change_wave = true;
}

if (current_wave != global.CountWaves && is_create_enemies) {
	if (global.SlideSide) {
		with (obj_parent_characters_enemies) {
			is_active_turn = false;
		}
		with (obj_parent_characters_allies) {
			is_active_turn = false;
		}
		with (obj_parent_characters_neutrals) {
			is_active_turn = false;
		}
		ds_priority_clear(init_queue);
		ds_priority_clear(init_queue_allies);
		ds_priority_clear(init_queue_neutrals);
		
		is_step_add_enemies = false;
		is_step_enemies = false;
		global.SlideSide = false;
		
		obj_character_main.is_active_turn = true;
		obj_character_main.is_blend = true;
		if (obj_character_main.percent_buff_immortality == 100 && instance_exists(obj_eagles_palm)) instance_destroy(obj_eagles_palm);
	}
	
	if (instance_exists(obj_parent_characters_neutrals)) {
		with (obj_parent_characters_neutrals) {
			statistic_add = 0;
		}
		with (obj_parent_characters_neutrals) {
			instance_destroy(obj_parent_characters_neutrals);	
		}
	}
	if (instance_exists(obj_manager_wave)) instance_destroy(obj_manager_wave);
	if (instance_exists(obj_parent_characters_allies)) instance_destroy(obj_parent_characters_allies);
	
	is_create_enemies = false;
	
	alarm[0] = 30;
}
#endregion

#region === ПРОЦЕСС ПЕРЕХОДА ХОДА [ПРОТИВНИКИ -> ИГРОК] ===
if (global.SlideSide) {
	obj_character_main.is_active_turn = false;
	if (current_enemies == 0) {	
		with (obj_parent_characters_enemies) {
			is_active_turn = false;
		}
		with (obj_parent_characters_allies) {
			is_active_turn = false;
		}
		with (obj_parent_characters_neutrals) {
			is_active_turn = false;
		}
		ds_priority_clear(init_queue);
		ds_priority_clear(init_queue_allies);
		ds_priority_clear(init_queue_neutrals);
		
		is_step_add_enemies = false;
		is_step_enemies = false;
		global.SlideSide = false;
		
		obj_character_main.is_active_turn = true;
		obj_character_main.is_blend = true;
		if (instance_exists(obj_modify_recovery_HP)) with (obj_modify_recovery_HP) is_recovery = true;
		if (instance_exists(obj_modify_recovery_MP)) with (obj_modify_recovery_MP) is_recovery = true;
		if (instance_exists(obj_modify_disarm))      with (obj_modify_disarm) is_recovery = true;
		if (instance_exists(obj_modify_bleeding))    with (obj_modify_bleeding) is_recovery = true;
		if (instance_exists(obj_modify_root))        with (obj_modify_root) is_recovery = true;
		if (instance_exists(obj_modify_rage))        with (obj_modify_rage) is_recovery = true;
		if (obj_character_main.percent_buff_immortality == 100 && instance_exists(obj_eagles_palm)) instance_destroy(obj_eagles_palm);

		current_enemies = -1;
	} else {
		if (!is_step_add_enemies) {
			with (obj_parent_characters_enemies) {
				ds_priority_add(other.init_queue, id, statistic_INITIATIVE);
		    }
			with (obj_parent_characters_allies) {
				ds_priority_add(other.init_queue_allies, id, statistic_INITIATIVE);
		    }
			with (obj_parent_characters_neutrals) {
				ds_priority_add(other.init_queue_neutrals, id, statistic_INITIATIVE);
		    }
			current_enemies = ds_priority_size(init_queue);
			if (current_enemies > 0) {
				if (ds_priority_size(init_queue_allies) > 0) current_enemies += ds_priority_size(init_queue_allies);
				if (ds_priority_size(init_queue_neutrals) > 0) current_enemies += ds_priority_size(init_queue_neutrals);
			}
			is_step_add_enemies = true;
			is_step_enemies = false;
		}
	
		if (!is_step_enemies) {
			if (ds_priority_size(init_queue) > 0) {
		        current_actor = ds_priority_delete_max(init_queue);
		    } else {
				if (ds_priority_size(init_queue_allies) > 0) {
					current_actor = ds_priority_delete_max(init_queue_allies);
				} else {
					current_actor = ds_priority_delete_max(init_queue_neutrals);
				}
			}
    
		    if (instance_exists(current_actor)) {
				current_actor.is_my_turn = true;
		        var _time_ref = 30;
				if (variable_instance_exists(current_actor, "is_enemy")) if (current_actor.is_enemy) _time_ref = 1;
				current_actor.alarm[1] = _time_ref;
		        is_step_enemies = true;
		    }
		}
	}
}
#endregion

#region === ПРОЦЕСС ПЕРЕХОДА ХОДА [ИГРОК -> ПРОТИВНИКИ] ===
if (obj_character_main.statistic_AP <= 0 && !global.SlideSide) { 
	alarm[1] = 30;
	obj_character_main.statistic_AP = obj_character_main.statistic_MAX_AP;
}
#endregion

#region === ПРОЦЕСС ПЕРЕХОДА ВОЛНЫ ===
if (is_change_wave) {
	blend_alpha += 0.01;
	if (blend_alpha >= 1) { blend_alpha = 1; is_change_wave = false; }
} else {
	blend_alpha -= 0.01;
	if (blend_alpha <= 0) blend_alpha = 0;
}
#endregion

#region === ПРОЦЕСС ТРЯСКИ КАМЕРЫ ===
if (is_shake) {
	x += random_range(-shakeRemain, shakeRemain);
	y += random_range(-shakeRemain, shakeRemain);

	shakeRemain = max(0, shakeRemain - ((1 / shakeLength) * shakeMagnitude));
	if (shakeRemain == 0) is_shake = false;
} else { x = camera_get_view_width(cam) / 4; y = camera_get_view_height(cam) / 4; }
camera_set_view_pos(cam, x - vWidth, y - vHeight);
#endregion