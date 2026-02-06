/// @description Процесс жизни

life_timer -= 1 / room_speed;

y -= move_speed;

if (life_timer > 0.5) {
    scale = lerp(1, 1.3, (1 - life_timer) * 2);
} else {
    scale = lerp(1.3, 0.8, (0.5 - life_timer) * 2);
}

if (life_timer < fade_start) {
    alpha = life_timer / fade_start;
}

if (life_timer <= 0) {
    instance_destroy();
}