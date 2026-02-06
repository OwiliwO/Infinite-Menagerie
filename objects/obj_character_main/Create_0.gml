/// @description Инициализация


event_inherited();

#region === ИНИЦИАЛИЗАЦИЯ ВИЗУАЛЬНЫХ ПАРАМЕТРОВ ===
sprite_index              = spr_main_dummy;
sprite_particles          = obj_particle_dummy;
image_index               = 0;
image_mask                = 0;
#endregion

#region === ИНИЦИАЛИЗАЦИЯ ОСНОВНЫХ ПАРАМЕТРОВ ===
last_hit                  = noone;
current_try               = [];
statistic_MAIN_ATTRIBUTE  = global.PlayerMainAttribute;
statistic_CURSE           = 0;
if (statistic_MAIN_ATTRIBUTE == "STRENGTH") {
	statistic_STRENGTH    = 10; // 10
	statistic_AGILITY     = 7;  // 7
	statistic_INTELEGENCE = 3;  // 3
	image_index           = 0;
}
if (statistic_MAIN_ATTRIBUTE == "AGILITY") {
	statistic_STRENGTH    = 5;  // 5
	statistic_AGILITY     = 10; // 10
	statistic_INTELEGENCE = 3;  // 4
	image_index           = 1;
}
if (statistic_MAIN_ATTRIBUTE == "INTELEGENCE") {
	statistic_STRENGTH    = 6;  // 6
	statistic_AGILITY     = 5;  // 5
	statistic_INTELEGENCE = 12; // 10
	image_index           = 2;
}
is_ability_mask           = true;
alarm[0]                  = 30;
#endregion

#region === ИНИЦИАЛИЗАЦИЯ ПОЗИЦИОНИРОВАНИЯ ===
is_have_fallen            = true;
x                         = grid_x * obj_manager_map.cell_size;
y                         = grid_y * obj_manager_map.cell_size;
#endregion

#region === ИНИЦИАЛИЗАЦИЯ ИНВЕНТАРЯ ===
var start_x               = 876; 
var start_y               = 40;
var slot_spacing          = 80;
var rows                  = 6;
var cols                  = 1;
for (var i = 0; i < 6; i++) {
    var row = i div cols;
    var col = i mod cols;
    
    var slot_x = start_x + col * slot_spacing;
    var slot_y = start_y + row * slot_spacing;
    
    var slot = instance_create_layer(slot_x, slot_y, "Grid", obj_slot_item);
    slot.slot_index = i;
    inventory_slots[i] = slot;
}


function add_item_to_inventory(item_object_index, x = -1, y = -1) {
    var free_slot = -1;
    for (var i = 0; i < 6; i++) {
        if (inventory_slots[i].is_empty) {
            free_slot = i;
            break;
        }
    }
    
    if (free_slot != -1) {
        var new_item = instance_create_layer(0, 0, "Characters", item_object_index);
        
        inventory_slots[free_slot].item_in_slot = new_item;
        inventory_slots[free_slot].is_empty = false;
        
        new_item.x = inventory_slots[free_slot].x;
        new_item.y = inventory_slots[free_slot].y;
		new_item.target_y = inventory_slots[free_slot].y;
		new_item.is_owned = true;
        
        return true;
    }
	
	return false;
}
function remove_item_from_inventory(item_object) {
    for (var i = 0; i < 6; i++) {
        if (inventory_slots[i].item_in_slot == item_object) {
            inventory_slots[i].item_in_slot = noone;
            inventory_slots[i].is_empty = true;
            instance_destroy(item_object);
			
            return true;
        }
    }
	
    return false;
}
function use_item_from_slot(slot_index) {
    audio_play_sound(snd_choose_keyboard, 100, 0);
	if (slot_index >= 0 && slot_index < 6) {
        inventory_slots[slot_index].use_item_in_slot();
    }
}
#endregion

alarm[3] = 120;