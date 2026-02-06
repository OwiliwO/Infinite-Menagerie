/// @description Инициализация


event_inherited();

#region === ИНИЦИАЛИЗАЦИЯ ВИЗУАЛЬНЫХ ПАРАМЕТРОВ ===
sprite_index              = spr_enemy_secret_shop;
sprite_particles          = obj_particle_secret_shop;
image_index               = 0;
image_mask                = 10;
#endregion

#region === ИНИЦИАЛИЗАЦИЯ ОСНОВНЫХ ПАРАМЕТРОВ ===
description_NAMING        = "Secret Shop Seller"
description_ALL           = get_translate(global.translate_grid, "desc_ALL_secret_shop")
description_FEATURE       = get_translate(global.translate_grid, "desc_FTR_secret_shop")
statistic_STRENGTH        = 5;
statistic_AGILITY         = 2;
statistic_INTELEGENCE     = 3;
statistic_MAIN_ATTRIBUTE  = "STRENGTH"
statistic_INITIATIVE      = irandom(10);

arr_items_consumable = [obj_mana_bottle, obj_mana_flask, obj_treatment_bottle, obj_treatment_flask, obj_apple, obj_cherry, obj_meat];
arr_items_equipment_1_lvl = [obj_poor_sword, obj_natures_guard, obj_reed];
arr_items_equipment_2_lvl = [obj_claymore, obj_stout_shield, obj_vignette];
arr_items_equipment_3_lvl = [obj_aglegor, obj_heart_barricade, obj_burzala];
arr_items_things = [obj_bulb_of_death, obj_eagles_palm, obj_edge, obj_flesh_relic, 
					obj_galvangars_ring, obj_gods_horn, obj_helmet_of_marauder, obj_heroic_emblem, 
					obj_leshys_heart, obj_mask_of_rage, obj_miracles_love, obj_ritual, 
					obj_thumb_of_midas, obj_unity_swarm];

alarm[0]                  = 30;
idle_speed                = random_range(0.5, 2);
#endregion

#region === ИНИЦИАЛИЗАЦИЯ МАГАЗИНА ===
var equipment_lvl = 1;
var arr_equipment = arr_items_equipment_1_lvl;

for (var i = 0; i < 6; i++) {
	var slot = obj_character_main.inventory_slots[i];
	if (!slot.is_empty) {
        var item = slot.item_in_slot;
		if (instance_exists(item)) {
	        if (item.object_index == obj_poor_sword) {
	            array_push(arr_equipment, arr_items_equipment_2_lvl[0])
	        }
			if (item.object_index == obj_claymore) {
	            array_push(arr_equipment, arr_items_equipment_3_lvl[0])
	        }
			if (item.object_index == obj_natures_guard) {
	            array_push(arr_equipment, arr_items_equipment_2_lvl[1])
	        }
			if (item.object_index == obj_stout_shield) {
	            array_push(arr_equipment, arr_items_equipment_3_lvl[1])
	        }
			if (item.object_index == obj_reed) {
	            array_push(arr_equipment, arr_items_equipment_2_lvl[2])
	        }
			if (item.object_index == obj_vignette) {
	            array_push(arr_equipment, arr_items_equipment_3_lvl[2])
	        }
		}
    }
}

arr_items_equipment_current = arr_equipment;

random_item_consumable = arr_items_consumable[irandom_range(0, array_length(arr_items_consumable) - 1)];
random_item_equipment = arr_items_equipment_current[irandom_range(0, array_length(arr_items_equipment_current) - 1)];
random_item_things_1 = arr_items_things[irandom_range(0, array_length(arr_items_things) - 1)];
random_item_things_2 = arr_items_things[irandom_range(0, array_length(arr_items_things) - 1)];

instance_create_layer(320, 200, "UI", random_item_equipment);
instance_create_layer(400, 150, "UI", random_item_things_1);
instance_create_layer(500, 150, "UI", random_item_things_2);
instance_create_layer(580, 200, "UI", random_item_consumable);

instance_create_layer(620, 280, "UI", obj_restore);
#endregion