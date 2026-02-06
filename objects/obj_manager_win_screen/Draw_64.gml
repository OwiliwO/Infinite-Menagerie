/// @description Визуализация


var _old_alpha = draw_get_alpha();
var _old_font = draw_get_font();
var _old_halign = draw_get_halign();
var _old_valign = draw_get_valign();
var _old_color = draw_get_color();

if (particle_spawned) {
    draw_set_alpha(blend_alpha_victory);
    for (var i = 0; i < array_length(star_particles); i++) {
        var star = star_particles[i];
        draw_set_color(make_color_rgb(255, 215, 0));
        draw_set_alpha(star.alpha);
        draw_circle(star._x, star._y, star.size, false);
    }
}

draw_set_alpha(blend_alpha_victory);
draw_set_font(fnt_naming);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var gradient_progress = sin(victory_timer / 30) * 0.3 + 0.7;
var gold_color = make_color_rgb(255, 215, 0);
var light_gold = make_color_rgb(255, 240, 180);

draw_text_ext_transformed_color(
    room_width, 
    room_height * 0.35, 
    victory_text, 
    40, 
    room_width * 0.8, 
    5, 
    5, 
    0,
    c_yellow,
    c_yellow,
    c_yellow,
    c_yellow,
    blend_alpha_victory);

draw_set_font(fnt_description);
draw_set_halign(fa_center);

draw_text_ext_transformed_color(
    room_width, 
    room_height * 0.55, 
    victory_phrase, 
    40, 
    room_width * 0.7, 
    3, 
    3, 
    0,
    make_color_rgb(255, 240, 180),
    make_color_rgb(255, 240, 180),
    make_color_rgb(255, 240, 180),
    make_color_rgb(255, 240, 180),
    blend_alpha_victory * 0.9);

var pulse = sin(victory_timer / 15) * 0.2 + 0.8;
draw_set_font(fnt_description);
draw_set_color(make_color_rgb(200, 180, 100));

draw_text_ext_transformed_color(
    room_width, 
    room_height * 0.85, 
    get_translate(global.translate_grid, "desc_continue"), 
    40, 
    500, 
    3.5, 
    3.5, 
    0,
    make_color_rgb(255, 240, 180),
    make_color_rgb(255, 240, 180),
    make_color_rgb(255, 240, 180),
    make_color_rgb(255, 240, 180),
    blend_alpha_victory * pulse);

if (blend_alpha_victory > 0.5) {
    draw_set_alpha(blend_alpha_victory);
    draw_set_color(make_color_rgb(180, 160, 40));
    
    //var crown_y = room_height * 0.2;
    //for (var i = 0; i < 8; i++) {
    //    var angle = i * 45 + victory_timer / 2;
    //    var x1 = room_width + 150 * cos(angle);
    //    var y1 = crown_y + 50 * sin(angle);
    //    var x2 = room_width + 130 * cos(angle + 20);
    //    var y2 = crown_y + 30 * sin(angle + 20);
    //    var x3 = room_width + 130 * cos(angle - 20);
    //    var y3 = crown_y + 30 * sin(angle - 20);
        
    //    draw_primitive_begin(pr_trianglelist);
    //    draw_vertex(x1, y1);
    //    draw_vertex(x2, y2);
    //    draw_vertex(x3, y3);
    //    draw_primitive_end();
    //}
}

draw_set_alpha(_old_alpha);
draw_set_font(_old_font);
draw_set_halign(_old_halign);
draw_set_valign(_old_valign);
draw_set_color(_old_color);