/// @description Инициализация


event_inherited();
item_name = "Unity Swarm";
item_description = get_translate(global.translate_grid, "desc_ALL_item_unity_swarm");
item_cost = 90;
item_rarity = 3;
mana_cost = 3;
sprite_index = spr_ui_items_thing;
sprite_particle_index = obj_particle_item_unity_swarm;
image_index = 4;


function use_item(user) {
    var target = user;
	
	sprite_index = spr_ui_items_thing_active;
	
	if (instance_exists(target)) {
		if (target.statistic_MP >= mana_cost) {
			target.statistic_AP--;
			target.statistic_MP -= mana_cost;
			
			part_particles_create(obj_manager_particle.particleSystem, 
								  target.drawing_x + sprite_width / 4, 
								  target.drawing_y, 
								  obj_manager_particle.particleInsects, 30);
			
		    with (obj_parent_characters_enemies) {
		        src_root_buff(100, grid_x, grid_y);
			}
			
		}
	}
	alarm[0] = 10;
	
    return false;
}