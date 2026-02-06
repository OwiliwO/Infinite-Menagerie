/// @description Физика частиц


if (image_index >= image_number - 1) {
    image_speed = 0;
}

if (particle_count != 0) {
    bounce += (pi * particle_speed);
    if (bounce > pi) {
        bounce -= pi;
        particle_height *= 0.6;
        particle_count--;
    }
    z = sin(bounce) * particle_height;
} else {
    z = 0;
}

detect++;
if (detect > particle_time_after) {
    image_alpha -= 1 / particle_time_after;
    if (image_alpha <= 0) instance_destroy();
}

vspd *= particle_vspeed;

y += vspd;




















