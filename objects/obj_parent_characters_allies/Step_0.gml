/// @description Итерация


event_inherited();

if (statistic_LIFE <= 0) instance_destroy();
if (instance_exists(obj_character_main)) {
	if (obj_character_main.statistic_AP <= 0) {
		statistic_LIFE--;
	}
}

if (!global.SlideSide && is_magic_attacking) is_magic_attacking = false;