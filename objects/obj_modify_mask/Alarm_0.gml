/// @description Назначение эффектов масок


var _prt = instance_create_layer(modify_id.x - modify_id.sprite_width * 2.5, modify_id.y, "UI", obj_particle_portreit_mask)
if (modify_id.image_mask > 9) modify_id.image_mask = 9;
if (modify_id.image_mask != 10) _prt.image_index = modify_id.image_mask - 1;

src_clue(modify_id, -1, "Change Mask", c_purple);

#region === НАЗНАЧЕНИЕ ЭФФЕКТОВ МАСОК ===
// == BUG == \\
if (modify_id.image_mask == 1) {
	modify_id.is_buff_revenge = true;
}
// == BULLDOG == \\
if (modify_id.image_mask == 2) {
	modify_id.is_buff_lunge_attack = true;
}
// == CAT == \\
if (modify_id.image_mask == 3) {
	modify_id.is_buff_double_turn = true;
}
// == DRAGONFLY == \\
if (modify_id.image_mask == 4) {
	modify_old_INTELEGENCE = modify_id.statistic_INTELEGENCE;
	modify_id.statistic_INTELEGENCE = obj_character_dragonfly.statistic_INTELEGENCE;
}
// == FOX == \\
if (modify_id.image_mask == 5) {
	modify_id.is_buff_bleeding = true;
}
// == MANTIS == \\
if (modify_id.image_mask == 6) {
	modify_id.is_buff_disarm = true;
}
// == PIG == \\
if (modify_id.image_mask == 7) {
	modify_id.is_buff_root = true;
}
// == RABBIT == \\
if (modify_id.image_mask == 8) {
	modify_id.is_buff_dodge = true;
}
// == WILD DOG (PUPPY) == \\
if (modify_id.image_mask == 9 || modify_id.image_mask == 11) {
	modify_id.is_buff_shadow = true;
}
// == SECRET SHOP == \\
if (modify_id.image_mask == 10) {
	modify_id.is_buff_teleport_turn = true;
}
#endregion


