/// @description Сопоставление


event_inherited();

if (instance_exists(obj_modify_grow)) {
	with (obj_modify_grow) {
		if (modify_id == id) instance_destroy();
	}
}