/// @description Инициализация


event_inherited();

#region === ИНИЦИАЛИЗАЦИЯ ВИЗУАЛЬНЫХ ПАРАМЕТРОВ ===
sprite_index              = spr_enemy_pig;
sprite_particles          = obj_particle_pig;
image_index               = 0;
image_mask                = 7;
#endregion

#region === ИНИЦИАЛИЗАЦИЯ ОСНОВНЫХ ПАРАМЕТРОВ ===
description_NAMING        = "Pig"
description_ALL           = get_translate(global.translate_grid, "desc_ALL_pig")
description_FEATURE       = get_translate(global.translate_grid, "desc_FTR_pig")
death_phrase              = get_translate(global.translate_grid, "desc_deph_pig")
statistic_STRENGTH        = 18;
statistic_AGILITY         = 4;
statistic_INTELEGENCE     = 3;
statistic_MAIN_ATTRIBUTE  = "AGILITY"
statistic_INITIATIVE      = irandom(10);
alarm[0]                  = 30;
idle_speed                = random_range(0.5, 2);
#endregion