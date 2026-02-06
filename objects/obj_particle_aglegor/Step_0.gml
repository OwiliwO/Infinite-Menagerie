/// @description Итерация


if (life == 0) {
    speed = 15;
}

if (speed > 0.1) {
    speed *= 0.7;
    
    x += lengthdir_x(speed, direction);
    y += lengthdir_y(speed, direction);
}

life++;

if (speed <= 0.1) {
    var progress = (life - slowdown_frame) / (fade_time * room_speed);
    image_alpha = 1 - progress;
}

if (life >= slowdown_frame + fade_time * room_speed) {
    instance_destroy();
}


