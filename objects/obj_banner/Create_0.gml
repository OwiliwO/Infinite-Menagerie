/// @description Инициализация


event_inherited();

function point_in_rectangle(px, py, x1, y1, x2, y2) {
    return px >= x1 && px <= x2 && py >= y1 && py <= y2;
}

hover_up = 1.0;
target_up = 1.0;
up_speed = 0.2;
max_up = 6.5;
normal_up = 1.5; 

text_naming = "Canvas of Glory";
text_description = "";

is_enteraction = true;
