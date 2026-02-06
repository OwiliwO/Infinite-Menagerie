/// @description Инициализация


event_inherited();

#region === ИНИЦИАЛИЗАЦИЯ ВИЗУАЛЬНЫХ ПАРАМЕТРОВ ===
sprite_index              = spr_enemy_cat;
sprite_particles          = obj_particle_cat;
image_index               = 0;
image_mask                = 3;
#endregion

#region === ИНИЦИАЛИЗАЦИЯ ОСНОВНЫХ ПАРАМЕТРОВ ===
description_NAMING        = "Cat"
description_ALL           = get_translate(global.translate_grid, "desc_ALL_cat")
description_FEATURE       = get_translate(global.translate_grid, "desc_FTR_cat")
death_phrase              = get_translate(global.translate_grid, "desc_deph_cat")
statistic_STRENGTH        = 5;
statistic_AGILITY         = 4;
statistic_INTELEGENCE     = 3;
statistic_MAIN_ATTRIBUTE  = "STRENGTH"
statistic_INITIATIVE      = irandom(10);
alarm[0]                  = 30;
idle_speed                = random_range(0.5, 2);
#endregion