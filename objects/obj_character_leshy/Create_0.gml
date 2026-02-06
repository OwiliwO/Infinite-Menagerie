/// @description Инициализация


event_inherited();

#region === ИНИЦИАЛИЗАЦИЯ ВИЗУАЛЬНЫХ ПАРАМЕТРОВ ===
sprite_index              = spr_boss_leshy;
sprite_particles          = obj_particle_dummy;
image_index               = 0;
image_mask                = 0;
#endregion

#region === ИНИЦИАЛИЗАЦИЯ ОСНОВНЫХ ПАРАМЕТРОВ ===
description_NAMING        = "Leshy"
description_ALL           = get_translate(global.translate_grid, "desc_ALL_leshy")
description_FEATURE       = get_translate(global.translate_grid, "desc_FTR_leshy")
death_phrase              = get_translate(global.translate_grid, "desc_deph_leshy")
statistic_STRENGTH        = 60;
statistic_AGILITY         = 6;
statistic_INTELEGENCE     = 15;
statistic_MAIN_ATTRIBUTE  = "AGILITY"
statistic_INITIATIVE      = irandom(10);
alarm[0]                  = 30;
idle_speed                = random_range(0.5, 2);
#endregion