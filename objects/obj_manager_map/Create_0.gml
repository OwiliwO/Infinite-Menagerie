/// @description Инициализация поля


grid_width              = 5;
grid_height             = 5;
cell_size               = 64;
grid_offset_x           = (room_width  - (grid_width * cell_size))  / 2;
grid_offset_y           = (room_height - (grid_height * cell_size)) / 2;

for (var i = 0; i < grid_width; i++) {
    for (var j = 0; j < grid_height; j++) {
        var cell = instance_create_layer(grid_offset_x + i * cell_size, grid_offset_y + j * cell_size, "Grid", obj_slot_map);
        if ((i == 0 && j == 0) ||
			(i == 0 && j == grid_height - 1) ||
			(i == grid_width - 1 && j == 0) ||
			(i == grid_width - 1 && j == grid_height - 1)) cell.current_image_index = 3;
		cell.grid_x = i;
        cell.grid_y = j;
    }
}

player_grid_x           = grid_width  div 2;
player_grid_y           = grid_height div 2 + 1;
