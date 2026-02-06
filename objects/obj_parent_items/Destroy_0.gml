/// @description Частицы и освобождение слота


var _partic_array = array_create(4, sprite_particle_index);
src_drop(x + sprite_width / 2, 
		 y + sprite_height / 2, 
		 _partic_array);