/// @description Инициализация


event_inherited();

#region === ИНИЦИАЛИЗАЦИЯ ВИЗУАЛЬНЫХ ПАРАМЕТРОВ ===
sprite_index              = spr_boss_forest_spirit;
sprite_particles          = obj_particle_dummy;
image_index               = 0;
image_mask                = 0;
#endregion

#region === ИНИЦИАЛИЗАЦИЯ ОСНОВНЫХ ПАРАМЕТРОВ ===
description_NAMING        = "Forest Spirit"
description_ALL           = get_translate(global.translate_grid, "desc_ALL_forest_spirit")
description_FEATURE       = get_translate(global.translate_grid, "desc_FTR_forest_spirit")
death_phrase              = get_translate(global.translate_grid, "desc_deph_forest_spirit")
statistic_STRENGTH        = 20;
statistic_AGILITY         = 3;
statistic_INTELEGENCE     = 6;
statistic_MAIN_ATTRIBUTE  = "STRENGTH"
statistic_INITIATIVE      = irandom(10);
alarm[0]                  = 30;
idle_speed                = random_range(0.5, 2);
is_active_alive           = false;
#endregion