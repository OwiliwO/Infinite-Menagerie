/// @description Действие


if (statistic_AP > 0) {
	skip_turn();
	alarm[2] = 1;
} else {
	end_turn();
	statistic_add = 0;
	instance_destroy();
}