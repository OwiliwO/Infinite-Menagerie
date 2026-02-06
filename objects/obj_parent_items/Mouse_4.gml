/// @description Покупка предмета


if (position_meeting(mouse_x, mouse_y, id)) {
	if (!is_owned) {
		if (global.PlayerGoldCount >= id.item_cost) {
			if (object_index == obj_claymore || object_index == obj_aglegor ||
				object_index == obj_stout_shield || object_index == obj_heart_barricade ||
				object_index == obj_vignette || object_index == obj_burzala) {
				var _is_equip_have = false;
				var _equip_object = noone;
				for (var i = 0; i < 6; i++) {
					var slot = obj_character_main.inventory_slots[i];
					if (!slot.is_empty) {
				        var item = slot.item_in_slot;
				        if (item.object_index == obj_poor_sword && object_index == obj_claymore) {
				            _equip_object = item.id;
							_is_equip_have = true;
							break;
				        }
						if (item.object_index == obj_claymore && object_index == obj_aglegor) {
				            _equip_object = item.id;
							_is_equip_have = true;
							break;
				        }
						if (item.object_index == obj_natures_guard && object_index == obj_stout_shield) {
				            _equip_object = item.id;
							_is_equip_have = true;
							break;
				        }
						if (item.object_index == obj_stout_shield && object_index == obj_heart_barricade) {
				            _equip_object = item.id;
							_is_equip_have = true;
							break;
				        }
						if (item.object_index == obj_reed && object_index == obj_vignette) {
				            _equip_object = item.id;
							_is_equip_have = true;
							break;
				        }
						if (item.object_index == obj_vignette && object_index == obj_burzala) {
				            _equip_object = item.id;
							_is_equip_have = true;
							break;
				        }
					}
				}
				
				if (_is_equip_have) {
					var is_add_item = false;
					with (obj_character_main) remove_item_from_inventory(_equip_object);
					with (obj_character_main) is_add_item = add_item_to_inventory(other.id.object_index);
					
					if (is_add_item) {
						audio_play_sound(snd_item_buy, 101, 0);
						global.PlayerGoldCount -= id.item_cost;
						src_clue(obj_character_secret_shop.id, id.item_cost, global.DescGold, c_yellow);
						cursor_sprite = spr_ui_cursor;
						instance_destroy();
					} else {
						is_blinking = true;
						blink_timer = blink_duration;
					}
				} else {
					is_blinking = true;
					blink_timer = blink_duration;
				}
				
			} else {
				var is_add_item = false;
				with (obj_character_main) is_add_item = add_item_to_inventory(other.id.object_index);
					
				if (is_add_item) {
					audio_play_sound(snd_item_buy, 101, 0);
					global.PlayerGoldCount -= id.item_cost;
					src_clue(obj_character_secret_shop.id, id.item_cost, global.DescGold, c_yellow);
					cursor_sprite = spr_ui_cursor;
					instance_destroy();
				} else {
					is_blinking = true;
					blink_timer = blink_duration;
				}
			}
		} else {
			is_blinking = true;
			blink_timer = blink_duration;
		}
	}
}