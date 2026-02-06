/// @description Инициализация


event_inherited();

#region === ИНИЦИАЛИЗАЦИЯ ВИЗУАЛЬНЫХ ПАРАМЕТРОВ ===
sprite_index              = spr_enemy_mantis;
sprite_particles          = obj_particle_mantis;
image_index               = 0;
image_mask                = 6;
#endregion

#region === ИНИЦИАЛИЗАЦИЯ ОСНОВНЫХ ПАРАМЕТРОВ ===
description_NAMING        = "Mantis"
description_ALL           = get_translate(global.translate_grid, "desc_ALL_mantis")
description_FEATURE       = get_translate(global.translate_grid, "desc_FTR_mantis")
death_phrase              = get_translate(global.translate_grid, "desc_deph_mantis")
statistic_STRENGTH        = 6;
statistic_AGILITY         = 3;
statistic_INTELEGENCE     = 5;
statistic_MAIN_ATTRIBUTE  = "INTELEGENCE"
statistic_INITIATIVE      = irandom(10);
alarm[0]                  = 30;
idle_speed                = random_range(0.5, 2);
#endregion