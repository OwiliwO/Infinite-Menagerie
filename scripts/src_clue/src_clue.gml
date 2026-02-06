

function src_clue(){
	if (!instance_exists(argument0)) return;
    
    var damage_text = instance_create_layer(
        argument0.drawing_x + 12, 
        argument0.drawing_y,
        "UI",
        obj_tooltip_clue
    );
    
    if (argument1 != -1) damage_text.damage_value = round(argument1);
	damage_text.text_value = argument2;
    damage_text.color = argument3;
    
    return damage_text;
}