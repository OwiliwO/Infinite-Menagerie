/// @description Увеличение характеристик с учетом волны


if ((obj_manager_main.current_wave + 1) mod 19 == 0) {
	obj_manager_main.multiplier += 0.4;
}

