/// @description Инициализация


event_inherited();

#region === ИНИЦИАЛИЗАЦИЯ ВИЗУАЛЬНЫХ ПАРАМЕТРОВ ===
sprite_index              = spr_enemy_bulldog;
sprite_particles          = obj_particle_bulldog;
image_index               = 0;
image_mask                = 2;
#endregion

#region === ИНИЦИАЛИЗАЦИЯ ОСНОВНЫХ ПАРАМЕТРОВ ===
description_NAMING        = "Bulldog"
description_ALL           = get_translate(global.translate_grid, "desc_ALL_bulldog")
description_FEATURE       = get_translate(global.translate_grid, "desc_FTR_bulldog")
death_phrase              = get_translate(global.translate_grid, "desc_deph_bulldog")
statistic_STRENGTH        = 7;
statistic_AGILITY         = 5;
statistic_INTELEGENCE     = 3;
statistic_MAIN_ATTRIBUTE  = "AGILITY"
statistic_INITIATIVE      = irandom(10);
alarm[0]                  = 30;
idle_speed                = random_range(0.5, 2);
#endregion