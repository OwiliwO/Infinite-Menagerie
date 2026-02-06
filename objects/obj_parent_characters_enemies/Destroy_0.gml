/// @description Сопоставление


event_inherited();

src_drop(drawing_x + sprite_width / 2,
	 drawing_y + sprite_height / 2, 
	 array_create(3, obj_particle_death));

if (object_index == obj_character_forest_spirit || object_index == obj_character_dryad || object_index == obj_character_leshy) {
	src_drop(drawing_x + sprite_width / 2,
		 drawing_y + sprite_height / 2, 
		 array_create(1, obj_particle_big_death));
}

if (obj_manager_wave.total_count_enemies > 0 && is_enemy) obj_manager_wave.total_count_enemies--;

if (global.SlideSide) obj_manager_main.is_step_enemies = false; 