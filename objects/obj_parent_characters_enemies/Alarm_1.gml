/// @description Активное состояние врага


if (is_my_turn) {
    is_active_turn = true;
	is_blend = true;
	if (is_enemy)  alarm[2] = 60;
	if (!is_enemy) alarm[2] = 1;
}