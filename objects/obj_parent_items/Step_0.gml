/// @description Итерация


if (obj_character_main.is_active_turn || !is_owned) visible = true; else visible = false;

idle_time += idle_speed / 100;
var offset_y = sin(idle_time) * idle_radius;
    
y = target_y + offset_y;

if (instance_exists(obj_tooltip) && position_meeting(mouse_x, mouse_y, id) && visible) {	
	obj_tooltip.tooltip_id = id;
	obj_tooltip.tooltip_text_naming = item_name;
	obj_tooltip.tooltip_text_description = item_description
	obj_tooltip.tooltip_visible = true;
}


if (is_blinking) {
    blink_timer--;
    
    if (blink_timer > blink_duration / 2) {
        image_blend = make_color_rgb(159, 56, 56);
    } else {
        image_blend = normal_color;
    }
    
    if (blink_timer <= 0) {
        is_blinking = false;
        image_blend = normal_color;
    }
}