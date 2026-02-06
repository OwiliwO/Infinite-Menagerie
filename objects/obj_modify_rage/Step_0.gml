/// @description Итерация


if (modify_count <= 0) instance_destroy();
if (instance_exists(modify_id)) {
	if (is_recovery) {
		if (modify_count > 1) src_clue(modify_id, -1, "Rage", c_red);
		modify_count--;
		is_recovery = false;
	}
}
					  
if (modify_id.is_buff_rage == true) {
	obj_manager_particle.particleImmortality_timer += delta_time / 1000000;
    
    if (obj_manager_particle.particleImmortality_timer >= obj_manager_particle.particleImmortality_interval) {
		obj_manager_particle.particleImmortality_timer = 0;
		part_particles_create(obj_manager_particle.particleSystem, 
		    modify_id.drawing_x + modify_id.sprite_width / 2, 
			modify_id.drawing_y + modify_id.sprite_height / 2, 
		    obj_manager_particle.particleRage, 5);	
	}
}