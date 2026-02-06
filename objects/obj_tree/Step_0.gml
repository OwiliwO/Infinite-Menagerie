/// @description Анимация объекта


hover_up = lerp(hover_up, target_up, up_speed);
if (idle_animation) {
	idle_time += idle_speed / 100;
	var offset_y = sin(idle_time) * idle_radius;
    
	drawing_y = target_y + offset_y;
}