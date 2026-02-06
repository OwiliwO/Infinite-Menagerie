/// @description Итерация


event_inherited();

if (is_owned && !is_owned_passive) {
	
	with (obj_character_main) {
		statistic_STRENGTH += 3;
		alarm[0] = 1;
	}
	with (obj_manager_main) update_curse();
	
	is_owned_passive = true;
}

if (obj_character_main.is_buff_immortality == true) {
	var center_x = obj_character_main.drawing_x + obj_character_main.sprite_width / 2;
	var center_y = obj_character_main.drawing_y + obj_character_main.sprite_height / 2;
	var a = 15;
	var t = current_time / 1000;

	var offset_x = a * cos(t);
	var offset_y = a * sin(2 * t) / 2;

	part_particles_create(obj_manager_particle.particleSystem, 
	    center_x + offset_x, 
	    center_y + offset_y, 
	    obj_manager_particle.particleImmortality, 1);
}