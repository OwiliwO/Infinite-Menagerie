/// @description Реинициализация


event_inherited();
if (instance_exists(random_item_consumable)) {
	with (random_item_consumable) if (!is_owned) instance_destroy();
}
if (instance_exists(random_item_equipment)) {
	with (random_item_equipment) if (!is_owned) instance_destroy();
}
if (instance_exists(random_item_things_1)) {
	with (random_item_things_1) if (!is_owned) instance_destroy();
}
if (instance_exists(random_item_things_2)) {
	with (random_item_things_2) if (!is_owned) instance_destroy();
}
if (instance_exists(obj_restore)) {
	instance_destroy(obj_restore);
}
