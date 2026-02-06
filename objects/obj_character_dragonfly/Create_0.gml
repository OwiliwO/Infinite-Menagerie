/// @description Инициализация


event_inherited();

#region === ИНИЦИАЛИЗАЦИЯ ВИЗУАЛЬНЫХ ПАРАМЕТРОВ ===
sprite_index              = spr_enemy_dragonfly;
sprite_particles          = obj_particle_dragonfly;
image_index               = 0;
image_mask                = 4;
#endregion

#region === ИНИЦИАЛИЗАЦИЯ ОСНОВНЫХ ПАРАМЕТРОВ ===
description_NAMING        = "Dragonfly"
description_ALL           = get_translate(global.translate_grid, "desc_ALL_dragonfly")
description_FEATURE       = get_translate(global.translate_grid, "desc_FTR_dragonfly")
death_phrase              = get_translate(global.translate_grid, "desc_deph_dragonfly")
statistic_STRENGTH        = 6;
statistic_AGILITY         = 5;
statistic_INTELEGENCE     = 12;
statistic_MAIN_ATTRIBUTE  = "AGILITY"
statistic_INITIATIVE      = irandom(10);
alarm[0]                  = 30;
idle_speed                = random_range(0.5, 2);
#endregion