/// @description Инициализация


event_inherited();

#region === ИНИЦИАЛИЗАЦИЯ ВИЗУАЛЬНЫХ ПАРАМЕТРОВ ===
sprite_index              = spr_enemy_rabbit;
sprite_particles          = obj_particle_rabbit;
image_index               = 0;
image_mask                = 8;
#endregion

#region === ИНИЦИАЛИЗАЦИЯ ОСНОВНЫХ ПАРАМЕТРОВ ===
description_NAMING        = "Rabbit"
description_ALL           = get_translate(global.translate_grid, "desc_ALL_rabbit")
description_FEATURE       = get_translate(global.translate_grid, "desc_FTR_rabbit")
death_phrase              = get_translate(global.translate_grid, "desc_deph_rabbit")
statistic_STRENGTH        = 5;
statistic_AGILITY         = 5;
statistic_INTELEGENCE     = 5;
statistic_MAIN_ATTRIBUTE  = "AGILITY"
statistic_INITIATIVE      = irandom(10);
alarm[0]                  = 30;
idle_speed                = random_range(0.5, 2);
statistic_OLD_HP          = statistic_HP;
is_update_statistic       = false;
#endregion