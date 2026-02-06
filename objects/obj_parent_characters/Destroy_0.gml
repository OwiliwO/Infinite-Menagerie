/// @description Частицы и освобождение клетки


with (obj_slot_map) {
	if (grid_x == other.grid_x && grid_y == other.grid_y) {
	    is_occupied = false;
	    occupying_object = noone;
	}
}            

var _partic_array = array_create(4, sprite_particles);
src_drop(drawing_x + sprite_width / 2,
	 drawing_y + sprite_height / 2, 
	 _partic_array);