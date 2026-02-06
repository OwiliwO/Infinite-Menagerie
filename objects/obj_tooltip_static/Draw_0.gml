/// @description Визуализация


if (tooltip_visible) {
	var _text_naming = tooltip_text_naming;
    var _text_description = tooltip_text_description;
    var _font_naming = tooltip_font_naming;
    var _font_description = tooltip_font_description;
    var _padding = 8;
    var _line_spacing = 4;
    var _max_width = 250;
    
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
    
    if (array_length(_description_lines) > 0) {
        _description_height -= _line_spacing;
    }
    
    var _content_width = max(_naming_width, _description_max_width);
    var _content_height = _naming_height + _line_spacing + _description_height;
    
    var _bg_width = _content_width + _padding * 2;
    var _bg_height = _content_height + _padding * 2;
    
    var _x = tooltip_x + 15;
    var _y = tooltip_y + 15;
    
    var _room_width = camera_get_view_width(view_camera[0]);
    var _room_height = camera_get_view_height(view_camera[0]);
    if (_x + _bg_width > _room_width) {
        _x = tooltip_x - _bg_width - 5;
    }
    if (_y + _bg_height > _room_height) {
        _y = tooltip_y - _bg_height - 5;
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
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    
    draw_set_font(_font_naming);
    draw_text(_x + _padding, _y + _padding, _text_naming);
    
    draw_set_font(_font_description);
    var _current_y = _y + _padding + _naming_height + _line_spacing;
    
    for (var i = 0; i < array_length(_description_lines); i++) {
		draw_text(_x + _padding, _current_y, _description_lines[i]);
        _current_y += string_height(_description_lines[i]) + _line_spacing;
    }
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_alpha(1);
}