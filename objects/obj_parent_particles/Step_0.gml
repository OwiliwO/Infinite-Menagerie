/// @description Физика частиц


if (particle_count != 0)
{
	bounce += (pi * particle_speed);
	if (bounce > pi)
	{
		bounce -= pi;
		particle_height *= 0.6;
		particle_count--;
	}
	z = sin(bounce) * particle_height;
}
else z = 0;


detect++;
if (detect > particle_time_after)
{
	image_alpha -= 1/particle_time_after;
	if (image_alpha <= 0) instance_destroy();
}


fri = 0.05;
if (z == 0) fri = 0.1;


x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);

spd = max(spd - fri, 0);