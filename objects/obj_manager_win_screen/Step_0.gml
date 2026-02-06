/// @description Итерация


if (blend_alpha_victory < 1) {
    blend_alpha_victory += 0.015;
} else {
    blend_alpha_victory = 1;
    
    victory_timer++;
    
    if (!particle_spawned && array_length(star_particles) == 0) {
        for (var i = 0; i < max_stars; i++) {
            var star = {
                _x: random(room_width * 2),
                _y: random(room_height * 2),
                size: random_range(2, 6),
                _speed: random_range(0.5, 2),
                alpha: random_range(0.3, 0.8),
                angle: random(360),
                sparkle: random(1)
            };
            array_push(star_particles, star);
        }
        particle_spawned = true;
    }
    
    sparkle_timer++;
    for (var i = 0; i < array_length(star_particles); i++) {
        var star = star_particles[i];
        star.angle += star._speed;
        star.sparkle += 0.05;
        star.alpha = 0.5 + 0.3 * sin(star.sparkle);
    }
}

