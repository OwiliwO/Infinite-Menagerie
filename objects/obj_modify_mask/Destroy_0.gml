/// @description Реинициализация

src_clue(modify_id, -1, "Mask Broken", c_green);

#region === РЕИНИЦИАЛИЗАЦИЯ ЭФФЕКТОВ МАСОК ===
// == BUG == \\
if (modify_id.image_mask == 1) {
	modify_id.is_buff_revenge = false;
}
// == BULLDOG == \\
if (modify_id.image_mask == 2) {
	modify_id.is_buff_lunge_attack = false;
}
// == CAT == \\
if (modify_id.image_mask == 3) {
	modify_id.is_buff_double_turn = false;
}
// == DRAGONFLY == \\
if (modify_id.image_mask == 4) {
	modify_id.statistic_INTELEGENCE = modify_old_INTELEGENCE;
}
// == FOX == \\
if (modify_id.image_mask == 5) {
	modify_id.is_buff_bleeding = false;
}
// == MANTIS == \\
if (modify_id.image_mask == 6) {
	modify_id.is_buff_disarm = false;
}
// == PIG == \\
if (modify_id.image_mask == 7) {
	modify_id.is_buff_root = false;
}
// == RABBIT == \\
if (modify_id.image_mask == 8) {
	modify_id.is_buff_dodge = false;
}
// == WILD DOG (PUPPY) == \\
if (modify_id.image_mask == 9 || modify_id.image_mask == 11) {
	modify_id.is_buff_shadow = false;
}
// == SECRET SHOP == \\
if (modify_id.image_mask == 10) {
	modify_id.is_buff_teleport_turn = false;
}
#endregion

modify_id.image_mask = 0;