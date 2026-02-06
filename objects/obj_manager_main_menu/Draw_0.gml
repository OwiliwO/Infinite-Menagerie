/// @description Визуализация


var _old_halign = draw_get_halign();
var _old_valign = draw_get_valign();
var _old_color = draw_get_color();
// Функция рисования слайдера
function draw_slider(_x, _y, _label, _value, _scale, _hover) {
    var slider_x = _x - slider_width/2;
    var slider_y = _y;
    
    draw_set_color(_hover ? hover_color : make_color_rgb(23, 10, 36));
    draw_text_transformed(_x, _y - 50, _label, 1.5 + _scale, 1.5 + _scale, 0);
    
    draw_set_color(make_color_rgb(23, 10, 36));
    draw_rectangle(slider_x, slider_y - slider_height / 2 - 15, 
                   slider_x + slider_width, slider_y + slider_height / 4 - 15, false);
    
    draw_set_color(hover_color);
    draw_rectangle(slider_x, slider_y - slider_height / 2 - 15, 
                   slider_x + _value * slider_width, slider_y + slider_height / 4 - 15, false);
    
    var handle_x = slider_x + _value * slider_width;
    draw_set_color(scale_color);
    draw_rectangle(handle_x - slider_handle_width / 2, slider_y - slider_height / 2 - 15,
                   handle_x + slider_handle_width / 2, slider_y + slider_height / 2 - 15, false);
    
    draw_set_color(make_color_rgb(23, 10, 36));
    draw_text_transformed(_x + slider_width / 2 + 35, _y - 15, string_format(_value * 100, 1, 1) + "%", 1.5, 1.5, 0);
}

// Функция рисования чекбокса
function draw_checkbox(_x, _y, _label, _checked, _scale, _hover) {
    var box_size = 30;
    draw_set_color(_hover ? hover_color: make_color_rgb(23, 10, 36));
    draw_text_transformed(_x - 120, _y, _label, 1.5 + _scale, 1.5 + _scale, 0);
    
    draw_set_color(_hover ? hover_color : make_color_rgb(23, 10, 36));
    draw_rectangle(_x + 90 - box_size/2, _y - box_size/2, 
                   _x + 90 + box_size/2, _y + box_size/2, false);
    
    if (!_checked) {
        draw_set_color(scale_color);
        draw_rectangle(_x + 90 - box_size/2 + 5, _y - box_size/2 + 5, 
                       _x + 90 + box_size/2 - 5, _y + box_size/2 - 5, false);
    }
}

// Функция рисования переключателя языка
function draw_language(_x, _y, _label,  _scale, _hover) {
    draw_set_color(_hover ? hover_color : make_color_rgb(23, 10, 36));
    draw_text_transformed(_x - 100, _y, _label, 1.5 + _scale, 1.5 + _scale, 0);
}

draw_set_font(fnt_description);
draw_set_color(make_color_rgb(23, 10, 36));

draw_sprite_ext(
    spr_ui_logo, 
    0, 
    room_width / 4 - 20, 
    current_logo_y, 
    1, 1, 0, 
    c_white, 
    1
);


draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (clue_change_attribute) {
	draw_text_transformed(480, 370, change_attribite, 1.5, 1.5, 0);
}

switch (state) {
    case menu_state.main:
    case menu_state.transition_to_game:
	case menu_state.transition_to_settings:
        for (var i = 0; i < 3; i++) {
            var bx = room_width/2;
            var by = button_current_y[i];
            
			if (i == 0) {
				var _c_str = make_color_rgb(159, 56, 56);
				var _c_agl = make_color_rgb(122, 174, 77);
				var _c_int = make_color_rgb(99, 182, 195);
				if (global.PlayerMainAttribute == "STRENGTH") draw_text_transformed_color(bx, by, button_texts[i], 1.5 + button_scale[i], 1.5 + button_scale[i], 0, _c_str, _c_str, _c_str, _c_str, 1);
				if (global.PlayerMainAttribute == "AGILITY") draw_text_transformed_color(bx, by, button_texts[i], 1.5 + button_scale[i], 1.5 + button_scale[i], 0, _c_agl, _c_agl, _c_agl, _c_agl, 1);
				if (global.PlayerMainAttribute == "INTELEGENCE") draw_text_transformed_color(bx, by, button_texts[i], 1.5 + button_scale[i], 1.5 + button_scale[i], 0, _c_int, _c_int, _c_int, _c_int, 1);
			} else draw_text_transformed(bx, by, button_texts[i], 1.5 + button_scale[i], 1.5 + button_scale[i], 0);
        }
    break;
}

// Рисование настроек
if (state == menu_state.settings || state == menu_state.transition_to_settings) {
    var elements_y = [400, 470, 385, 455, 510];
    
    // Слайдер громкости музыки
    draw_slider(room_width / 4, settings_x + elements_y[0], setting_button_texts[0], music_volume, 1, settings_hover[0]);
    
    // Слайдер громкости звуков
    draw_slider(room_width / 4, settings_x + elements_y[1], setting_button_texts[1], sound_volume, 1, settings_hover[1]);
	
    // Чекбокс полноэкранного режима
    draw_checkbox(room_width - 150, settings_x + elements_y[2], setting_button_texts[2], fullscreen, settings_scale[2], settings_hover[2]);
	
    // Переключатель языка
    draw_language(room_width - 130, settings_x + elements_y[3], setting_button_texts[3], settings_scale[3], settings_hover[3]);
	
	draw_set_color(make_color_rgb(23, 10, 36));
    draw_text_transformed(room_width - 50, settings_x + elements_y[4], setting_button_texts[4], 1.5 + settings_scale[4], 1.5 + settings_scale[4], 0);
}

draw_set_halign(_old_halign);
draw_set_valign(_old_valign);
draw_set_color(_old_color);