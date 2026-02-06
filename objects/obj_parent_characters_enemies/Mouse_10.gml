/// @description Визуализация подсказок


if (instance_exists(obj_tooltip_description) && position_meeting(mouse_x, mouse_y, id)) {
	obj_tooltip_description.tooltip_id = id;
	obj_tooltip_description.tooltip_text_naming = description_NAMING;
	obj_tooltip_description.tooltip_sprite = sprite_index;
	obj_tooltip_description.tooltip_value_HP = statistic_HP;
	obj_tooltip_description.tooltip_value_AP = statistic_AP;
	obj_tooltip_description.tooltip_value_ATK = statistic_DAMAGE;
	obj_tooltip_description.tooltip_value_SPD = statistic_SPEED;
	obj_tooltip_description.tooltip_text_description = description_ALL;
	obj_tooltip_description.tooltip_text_description2 = description_FEATURE;
	obj_tooltip_description.tooltip_visible = true;
}