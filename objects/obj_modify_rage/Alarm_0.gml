/// @description Назначение безумства

if (instance_exists(modify_id)) {
	modify_id.statistic_AGILITY *= modify_AP;
	with (modify_id) alarm[0] = 1;
}
src_clue(modify_id, -1, "Rage Start", c_red);

