/// @description Итерация


event_inherited();

if (instance_exists(obj_parent_characters_neutrals) && is_active_turn && !is_active_alive) {
	if (instance_exists(obj_character_grove)) {
		with (obj_character_grove) {
			if (!is_enemy) {
				sprite_index = spr_enemy_treant;
				idle_speed = random_range(0.5, 2);
				is_enemy = true;
				instance_create_layer(drawing_x + sprite_width / 4 + 5, drawing_y - 15, "UI", obj_attention);
				obj_manager_wave.total_count_enemies++;
			}
		}
	}
	if (instance_exists(obj_character_log)) {
		with (obj_character_log) {
			if (!is_enemy) {
				sprite_index = spr_enemy_treant;
				idle_speed = random_range(0.5, 2);
				is_enemy = true;
				instance_create_layer(drawing_x + sprite_width / 4 + 5, drawing_y - 15, "UI", obj_attention);
				obj_manager_wave.total_count_enemies++;
			}
		}
	}
	if (instance_exists(obj_character_tree)) {
		with (obj_character_tree) {
			if (!is_enemy) {
				sprite_index = spr_enemy_treant;
				idle_speed = random_range(0.5, 2);
				is_enemy = true;
				instance_create_layer(drawing_x + sprite_width / 4 + 5, drawing_y - 15, "UI", obj_attention);
				obj_manager_wave.total_count_enemies++;
			}
		}
	}
	is_active_alive = true;
}