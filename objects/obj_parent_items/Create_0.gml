/// @description Инициализация


#region === ИНИЦИАЛИЗАЦИЯ ВИЗУАЛЬНЫХ ПАРАМЕТРОВ ===
sprite_index              = noone;
sprite_particle_index     = noone;
image_index               = 0;
#endregion

#region === ИНИЦИАЛИЗАЦИЯ ОСНОВНЫХ ПАРАМЕТРОВ ===
item_name                 = "None";
item_description          = "None";
item_rarity               = 0;
item_cost                 = 0;
item_ritual               = false;

is_consumable             = true;
is_owned                  = false;
is_owned_passive          = false;
is_enteraction            = true;

target_y                  = y;
idle_time                 = 0;
idle_radius               = 3;
idle_speed                = random_range(1.5, 3);

blink_timer               = 0;
blink_duration            = 10;
is_blinking               = false;
normal_color              = c_white;
angle_rarity              = 0;
#endregion

#region === ОСНОВНЫЕ ФУНКЦИИ ОБЪЕКТОВ ===
function use_item(user) {
    show_debug_message("Using " + item_name);
    return true;
}
#endregion
