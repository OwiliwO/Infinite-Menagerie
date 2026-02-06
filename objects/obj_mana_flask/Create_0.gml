/// @description Инициализация

event_inherited();
item_name = "Mana Flask";
item_description = get_translate(global.translate_grid, "desc_ALL_item_mana_flask");
item_cost = 60;
item_rarity = 4;
sprite_index = spr_ui_items_consumable;
sprite_particle_index = obj_particle_item_mana_flask;
image_index = 0;


function use_item(user) {
    var target = user;
	var add = 3;
	var add_count = 3;
    
    if (instance_exists(target)) {
		if (!instance_exists(obj_modify_recovery_MP)) {
			var _modify = instance_create_layer(0, 0, "UI", obj_modify_recovery_MP);
			_modify.modify_id = target;
			_modify.modify_count = add_count;
			_modify.modify_recovery = add;
		}
        
        return true;
    }
    
    return false;
}