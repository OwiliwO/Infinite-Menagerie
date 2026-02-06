/// @description Визуализация


event_inherited();

if (is_ability_mask) {
	draw_sprite(spr_mask, image_mask, drawing_x, drawing_y);
}
if (!is_ability_mask) draw_sprite(spr_main_dummy_custom, 0, obj_character_main.drawing_x, obj_character_main.drawing_y);

if (is_active_turn) {
	var draw_stat_bar = function(sprite, current, _max, y_pos, segment_width, segment_count) {
        var segments_per_row = segment_count;
        var row_offset = 8;
        
        var rows = ceil(_max / segments_per_row);
        
        var row_width = segments_per_row * segment_width;
        var start_x = 20;
        
        for (var i = 0; i < _max; i++) {
            var row = i div segments_per_row;
            var position_in_row = i mod segments_per_row;
            
            var x_pos = start_x + position_in_row * segment_width;
            var y_offset = y_pos + row * row_offset;
            
            var frame = (i < current) ? 0 : 1;
            draw_sprite_ext(sprite, frame, x_pos, y_offset, 0.5, 0.5, 0, c_white, 1);
        }
    }
    
	draw_stat_bar(spr_ui_hp, statistic_HP, statistic_MAX_HP, 20, 32, 10);
	draw_stat_bar(spr_ui_mp, statistic_MP, statistic_MAX_MP, 70, 24, 12);
	draw_stat_bar(spr_ui_ap, statistic_AP, statistic_MAX_AP, 100, 24, 12);
}