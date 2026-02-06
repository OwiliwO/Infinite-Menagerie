/// @description Анимация объекта


hover_up = lerp(hover_up, target_up, up_speed);
if (idle_animation) {
	idle_time += idle_speed / 100;
	var offset_y = sin(idle_time) * idle_radius;
    
	drawing_y = target_y + offset_y;
}

if (instance_exists(obj_tooltip) && position_meeting(mouse_x, mouse_y, id) && visible && is_clue) {
	obj_tooltip.tooltip_id = id;
	obj_tooltip.tooltip_text_naming = text_naming;
	obj_tooltip.tooltip_text_description = text_description;
	obj_tooltip.tooltip_visible = true;
}