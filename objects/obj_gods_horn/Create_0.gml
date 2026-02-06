/// @description Инициализация


event_inherited();
item_name = "God's Horn";
item_description = get_translate(global.translate_grid, "desc_ALL_item_gods_horn");
item_cost = 100;
item_rarity = 3;
mana_cost = 4;
sprite_index = spr_ui_items_thing;
sprite_particle_index = obj_particle_item_gods_horn;
image_index = 2;


function use_item(user) {
    var target = user;
	var damage = target.statistic_STRENGTH * target.base_grow_STRENGTH div 8;
	var damage_range = 2;
	
	sprite_index = spr_ui_items_thing_active;
	
	if (instance_exists(target)) {
		if (target.statistic_MP >= mana_cost) {
			target.statistic_AP--;
			
			var manager = obj_manager_map;
		    var enemies_hit = 0;
			
			part_particles_create(obj_manager_particle.particleSystem, 
							target.drawing_x + sprite_width / 4, 
							target.drawing_y, 
							obj_manager_particle.particleDustCollapse, 10);
			
		    with (obj_parent_characters_enemies) {
		        var dist_x = abs(user.grid_x - grid_x);
		        var dist_y = abs(user.grid_y - grid_y);
        
		        if (dist_x <= damage_range && dist_y <= damage_range) {
            
		            statistic_HP -= damage;
            
		            src_clue(id, damage, "Splash", c_red);
					with (obj_manager_main) camera_shake(6, 12);
		            start_shake(8, 2);
            
		            if (statistic_HP <= 0) {
		                with (obj_slot_map) {
		                    if (grid_x == other.grid_x && grid_y == other.grid_y) {
		                        is_occupied = false;
		                        occupying_object = noone;
		                    }
		                }
		                instance_destroy();
		            }
            
		            enemies_hit++;
		        }
			}
			
		}
	}
	alarm[0] = 10;
	
    return false;
}