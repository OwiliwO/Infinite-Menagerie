/// @description Визуализация


if (tooltip_visible && position_meeting(mouse_x, mouse_y, tooltip_id)) {
    var _text_naming = tooltip_text_naming;
    var _text_description = tooltip_text_description;
    var _text_description2 = tooltip_text_FTR + tooltip_text_description2;
    var _font_naming = tooltip_font_naming;
    var _font_description = tooltip_font_description;
    var _sprite = tooltip_sprite;
    var _sprite_HP = tooltip_sprite_HP;
    var _sprite_AP = tooltip_sprite_AP;
    
    var _padding = 8;
    var _line_spacing = 4;
    var _element_spacing = 6;
    var _paragraph_spacing = 12;
    var _max_width = 130;
    
    draw_set_font(_font_naming);
    var _naming_width = string_width(_text_naming);
    var _naming_height = string_height(_text_naming);
    
    var _wrap_text = function(_text, _font, _max_w) {
        draw_set_font(_font);
        var _words = string_split(_text, " ");
        var _lines = [];
        var _current_line = "";
        
        for (var i = 0; i < array_length(_words); i++) {
            var _test_line = _current_line;
            if (_current_line == "") {
                _test_line = _words[i];
            } else {
                _test_line = _current_line + " " + _words[i];
            }
            
            var _test_width = string_width(_test_line);
            
            if (_test_width > _max_w && _current_line != "") {
                array_push(_lines, _current_line);
                _current_line = _words[i];
            } else {
                _current_line = _test_line;
            }
        }
        
        if (_current_line != "") {
            array_push(_lines, _current_line);
        }
        
        return _lines;
    };
    
    var _description_lines = _wrap_text(_text_description, _font_description, _max_width);
    var _description_lines2 = _wrap_text(_text_description2, _font_description, _max_width);
    
    var _sprite_width = 0;
    var _sprite_height = 0;
    if (_sprite != noone) {
        _sprite_width = sprite_get_width(_sprite);
		if (_sprite == spr_enemy_tree) _sprite_width = 45;
        _sprite_height = sprite_get_height(_sprite);
    }
    
    var _icon_size = 16;
    var _stats_width = 0;
    var _stats_height = 0;
    
    var _hp_text = ": " + string(tooltip_value_HP);
    var _ap_text = ": " + string(tooltip_value_AP);
    var _atk_text = tooltip_text_ATK + ": " + string(tooltip_value_ATK);
    var _scr_text = tooltip_text_SPD + ": " + string(tooltip_value_SPD);
    
    var _hp_width = string_width(_hp_text);
    var _ap_width = string_width(_ap_text);
    var _atk_width = string_width(_atk_text);
    var _scr_width = string_width(_scr_text);
    var _text_height = string_height(_hp_text);
    
    var _atk_scr_lines = _wrap_text(_atk_text + "    " + _scr_text, _font_description, _max_width);
    var _atk_scr_height = 0;
    var _atk_scr_max_width = 0;
    
    for (var i = 0; i < array_length(_atk_scr_lines); i++) {
        var _line_width = string_width(_atk_scr_lines[i]);
        if (_line_width > _atk_scr_max_width) {
            _atk_scr_max_width = _line_width;
        }
        _atk_scr_height += string_height(_atk_scr_lines[i]) + _line_spacing;
    }
    if (array_length(_atk_scr_lines) > 0) {
        _atk_scr_height -= _line_spacing;
    }
    
    _stats_width = max(_hp_width, _ap_width) + _icon_size + _element_spacing;
    _stats_height = _text_height * 2 + _element_spacing;
    
    draw_set_font(_font_description);
    var _description_height = 0;
    var _description_max_width = 0;
    
    for (var i = 0; i < array_length(_description_lines); i++) {
        var _line_width = string_width(_description_lines[i]);
        if (_line_width > _description_max_width) {
            _description_max_width = _line_width;
        }
        _description_height += string_height(_description_lines[i]) + _line_spacing;
    }
    
    for (var i = 0; i < array_length(_description_lines2); i++) {
        var _line_width = string_width(_description_lines2[i]);
        if (_line_width > _description_max_width) {
            _description_max_width = _line_width;
        }
        _description_height += string_height(_description_lines2[i]) + _line_spacing;
    }
    
    var _total_paragraphs = 0;
    if (array_length(_atk_scr_lines) > 0) _total_paragraphs++;
    if (array_length(_description_lines) > 0) _total_paragraphs++;
    if (array_length(_description_lines2) > 0) _total_paragraphs++;
    
    var _total_paragraph_spacing = (_total_paragraphs - 1) * _paragraph_spacing;
    
    var _content_width = max(_naming_width, _sprite_width + _stats_width + _element_spacing, 
                            _description_max_width, _atk_scr_max_width);
    var _content_height = _naming_height + _element_spacing + 
                         max(_sprite_height, _stats_height) + _element_spacing + 
                         _atk_scr_height + _description_height + _total_paragraph_spacing;
    
    var _bg_width = _content_width + _padding * 2;
    var _bg_height = _content_height + _padding * 2;
    
    var _room_width = camera_get_view_width(view_camera[0]);
    var _room_height = camera_get_view_height(view_camera[0]);
    
    var _x = _room_width * 0.7;
    var _y = _room_height * 0.5 - _bg_height * 0.5;
    
    if (_x + _bg_width > _room_width) {
        _x = _room_width - _bg_width - 5;
    }
    if (_y + _bg_height > _room_height) {
        _y = _room_height - _bg_height - 5;
    }
    
    _x = max(0, _x);
    _y = max(0, _y);
    
    draw_set_color(make_color_rgb(23, 10, 36));
    draw_set_alpha(0.8);
    draw_rectangle(_x, _y, _x + _bg_width, _y + _bg_height, false);
    
    draw_set_color(make_color_rgb(248, 241, 229));
    draw_set_alpha(0.3);
    draw_rectangle(_x, _y, _x + _bg_width, _y + _bg_height, true);
    
    draw_set_alpha(1);
    draw_set_color(make_color_rgb(248, 241, 229));
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    
    draw_set_font(_font_naming);
    draw_text(_x + _bg_width / 2, _y + _padding, _text_naming);
    
    var _content_y = _y + _padding + _naming_height + _element_spacing;
    var _content_x = _x + _padding;
    
    if (_sprite != noone) {
        var _sprite_x = _content_x;
        var _sprite_y = _content_y;
        draw_sprite(_sprite, 0, _sprite_x + _sprite_width / 2 - 12, _sprite_y + _sprite_height / 2 - 35);
    }
    
    var _stats_x = _content_x + _sprite_width + _element_spacing;
    var _stats_y = _content_y;
    
    draw_set_halign(fa_left);
    draw_set_font(_font_naming);
    
    if (_sprite_HP != noone) {
        draw_sprite_ext(_sprite_HP, 0, _stats_x + _icon_size / 2 - 5, _stats_y + _icon_size / 2 - 5, 0.5, 0.5, 0, c_white, 1);
    }
    draw_text(_stats_x + _icon_size + _element_spacing + 16, _stats_y, _hp_text);
    
    if (_sprite_AP != noone) {
        draw_sprite_ext(_sprite_AP, 0, _stats_x + _icon_size / 2 - 1, _stats_y + _text_height + _element_spacing + _icon_size / 2 + 10, 0.5, 0.5, 0, c_white, 1);
    }
    draw_text(_stats_x + _icon_size + _element_spacing + 16, _stats_y + _text_height + _element_spacing + 13, _ap_text);
    
    var _current_y = _content_y + max(_sprite_height, _stats_height) + _element_spacing;
    draw_set_halign(fa_left);
    draw_set_font(_font_description);
    
    if (array_length(_atk_scr_lines) > 0) {
        for (var i = 0; i < array_length(_atk_scr_lines); i++) {
            draw_text(_content_x, _current_y, _atk_scr_lines[i]);
            _current_y += string_height(_atk_scr_lines[i]) + _line_spacing;
        }
        _current_y += _paragraph_spacing - _line_spacing;
    }
    
    if (array_length(_description_lines) > 0) {
        for (var i = 0; i < array_length(_description_lines); i++) {
            draw_text(_content_x, _current_y, _description_lines[i]);
            _current_y += string_height(_description_lines[i]) + _line_spacing;
        }
        _current_y += _paragraph_spacing - _line_spacing;
    }
    
    if (array_length(_description_lines2) > 0) {
        for (var i = 0; i < array_length(_description_lines2); i++) {
            draw_text(_content_x, _current_y, _description_lines2[i]);
            _current_y += string_height(_description_lines2[i]) + _line_spacing;
        }
    }
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_alpha(1);
}