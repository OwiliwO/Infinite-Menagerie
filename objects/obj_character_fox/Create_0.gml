/// @description Инициализация


event_inherited();

#region === ИНИЦИАЛИЗАЦИЯ ВИЗУАЛЬНЫХ ПАРАМЕТРОВ ===
sprite_index              = spr_enemy_fox;
sprite_particles          = obj_particle_fox;
image_index               = 0;
image_mask                = 5;
#endregion

#region === ИНИЦИАЛИЗАЦИЯ ОСНОВНЫХ ПАРАМЕТРОВ ===
description_NAMING        = "Fox"
description_ALL           = get_translate(global.translate_grid, "desc_ALL_fox")
description_FEATURE       = get_translate(global.translate_grid, "desc_FTR_fox")
death_phrase              = get_translate(global.translate_grid, "desc_deph_fox")
statistic_STRENGTH        = 9;
statistic_AGILITY         = 4;
statistic_INTELEGENCE     = 5;
statistic_MAIN_ATTRIBUTE  = "AGILITY"
statistic_INITIATIVE      = irandom(10);
alarm[0]                  = 30;
idle_speed                = random_range(0.5, 2);
#endregion