/// @description Визуализация


var _old_font = draw_get_font();

angle_rarity += 0.2; if (angle_rarity >= 360) angle_rarity -= 360;
draw_sprite_ext(
    spr_ui_items_rarity,
    item_rarity,           
    x + sprite_width / 2,
    y + sprite_height / 2,
    1,
    1,
    angle_rarity,
    c_white,
    0.8
);

draw_sprite_ext(
    sprite_index, 
    image_index, 
    x, 
    y, 
    1, 
    1, 
    0, 
    image_blend, 
    image_alpha
);

if (!is_owned) {
	draw_set_font(fnt_naming);
	draw_text_ext_color(x + sprite_width / 4, y - 30, item_cost, 40, 40, c_yellow, c_yellow, c_yellow, c_yellow, 1);
}

draw_set_font(_old_font);