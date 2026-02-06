/// @description Ход обучения

if (obj_manager_main.current_wave + 1 <= 3 && step_of_eductation <= 10) {
	if (keyboard_check_pressed(vk_space) && step_of_eductation != 4 && step_of_eductation != 9) step_of_eductation++;
	if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, obj_character_main.id) && step_of_eductation == 4)  step_of_eductation++;
}
if (obj_manager_main.current_wave + 1 == 4 && step_of_eductation_shop <= 2) {
	if (keyboard_check_pressed(vk_space)) step_of_eductation_shop++;
}
if (global.CountWaves == 1 && step_of_eductation == 9) step_of_eductation = 10;

if (instance_exists(obj_tooltip_static) && step_of_eductation <= 10) {
	obj_tooltip_static.tooltip_id = id;
	obj_tooltip_static.tooltip_text_naming = variable_instance_get(id, "naming_training_" + string(step_of_eductation));
	obj_tooltip_static.tooltip_text_description = variable_instance_get(id, "desc_training_" + string(step_of_eductation));
	obj_tooltip_static.tooltip_visible = true;
	
	if (step_of_eductation == 1) { obj_tooltip_static.tooltip_x = 50; obj_tooltip_static.tooltip_y = 50; }
	if (step_of_eductation == 2) { obj_tooltip_static.tooltip_x = 500; obj_tooltip_static.tooltip_y = 10; }
	if (step_of_eductation == 3) { obj_tooltip_static.tooltip_x = 900; obj_tooltip_static.tooltip_y = 30; }
	if (step_of_eductation == 4) { obj_tooltip_static.tooltip_x = 500; obj_tooltip_static.tooltip_y = 400; }
	if (step_of_eductation == 5) { obj_tooltip_static.tooltip_x = 10; obj_tooltip_static.tooltip_y = 250; }
	if (step_of_eductation == 6) { obj_tooltip_static.tooltip_x = 30; obj_tooltip_static.tooltip_y = 250; }
	if (step_of_eductation == 7) { obj_tooltip_static.tooltip_x = 200; obj_tooltip_static.tooltip_y = 50; }
	if (step_of_eductation == 8) { obj_tooltip_static.tooltip_x = 650; obj_tooltip_static.tooltip_y = 250; }
	if (step_of_eductation == 9) { obj_tooltip_static.tooltip_x = 50; obj_tooltip_static.tooltip_y = 50; }
	if (step_of_eductation == 10){ obj_tooltip_static.tooltip_x = 100; obj_tooltip_static.tooltip_y = 100; }
} else if (step_of_eductation > 10) obj_tooltip_static.tooltip_visible = false;

if ((obj_manager_main.current_wave + 1) mod 4 == 0) {
	if (instance_exists(obj_tooltip_static) && step_of_eductation_shop <= 2) {
		obj_tooltip_static.tooltip_id = id;
		obj_tooltip_static.tooltip_text_naming = variable_instance_get(id, "naming_training_shop_" + string(step_of_eductation_shop));
		obj_tooltip_static.tooltip_text_description = variable_instance_get(id, "desc_training_shop_" + string(step_of_eductation_shop));
		obj_tooltip_static.tooltip_visible = true;
	}
	
	if (step_of_eductation_shop == 1) { obj_tooltip_static.tooltip_x = 50; obj_tooltip_static.tooltip_y = 50; }
	if (step_of_eductation_shop == 2) { obj_tooltip_static.tooltip_x = 500; obj_tooltip_static.tooltip_y = 10; }
	if (step_of_eductation_shop > 2) global.FirstPlayCheck = false;
}
if ((step_of_eductation > 10 && step_of_eductation_shop > 2) || !global.FirstPlayCheck) {
	instance_destroy(obj_tooltip_static);
	instance_destroy(obj_tooltip_education);
}