/// @description Инициализация


event_inherited();

#region === ИНИЦИАЛИЗАЦИЯ ВИЗУАЛЬНЫХ ПАРАМЕТРОВ ===
sprite_index              = spr_enemy_dummy;
sprite_particles          = obj_particle_dummy;
image_index               = 0;
image_mask                = 0;
#endregion

#region === ИНИЦИАЛИЗАЦИЯ ОСНОВНЫХ ПАРАМЕТРОВ ===
description_NAMING        = "Dummy"
description_ALL           = get_translate(global.translate_grid, "desc_ALL_dummy")
description_FEATURE       = get_translate(global.translate_grid, "desc_FTR_dummy")
statistic_STRENGTH        = 5;
statistic_AGILITY         = 2;
statistic_INTELEGENCE     = 3;
statistic_MAIN_ATTRIBUTE  = "STRENGTH"
statistic_INITIATIVE      = irandom(10);
alarm[0]                  = 30;
idle_speed                = random_range(0.5, 2);
#endregion