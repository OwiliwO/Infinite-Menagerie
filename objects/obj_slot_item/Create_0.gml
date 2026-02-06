/// @description Инициализация


event_inherited();

#region === ИНИЦИАЛИЗАЦИЯ ОСНОВНЫХ ПАРАМЕТРОВ ===
text_naming               = "Inventory slot";
text_description          = "";
slot_index                = 0;
item_in_slot              = noone;
is_empty                  = true;
is_clue                   = false;
#endregion

#region === ОСНОВНАЯ ФУНКЦИЯ ПРЕДМЕТА ===
function use_item_in_slot() {
    if (!is_empty && instance_exists(item_in_slot)) {
        if (item_in_slot.use_item(obj_character_main)) {
            if (item_in_slot.is_consumable) {
                instance_destroy(item_in_slot);
                item_in_slot = noone;
                is_empty = true;
            }
        }
    }
}
#endregion