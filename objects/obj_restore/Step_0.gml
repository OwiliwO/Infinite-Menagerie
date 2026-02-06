/// @description Использование способности


event_inherited();

if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id)) {
	if (global.PlayerGoldCount > restore_cost) {
		global.PlayerGoldCount -= restore_cost;
		restore_cost *= 2;
		
		src_create_item_shop();
	}
}
