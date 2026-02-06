/// @description Инициализация


event_inherited();

#region === ИНИЦИАЛИЗАЦИЯ ВИЗУАЛЬНЫХ ПАРАМЕТРОВ ===
sprite_index              = spr_boss_dryad;
sprite_particles          = obj_particle_dummy;
image_index               = 0;
image_mask                = 0;
#endregion

#region === ИНИЦИАЛИЗАЦИЯ ОСНОВНЫХ ПАРАМЕТРОВ ===
description_NAMING        = "Dryad"
description_ALL           = get_translate(global.translate_grid, "desc_ALL_dryad")
description_FEATURE       = get_translate(global.translate_grid, "desc_FTR_dryad")
death_phrase              = get_translate(global.translate_grid, "desc_deph_dryad")
statistic_STRENGTH        = 25;
statistic_AGILITY         = 5;
statistic_INTELEGENCE     = 17;
statistic_MAIN_ATTRIBUTE  = "INTELEGENCE"
statistic_INITIATIVE      = irandom(10);
statistic_HEALTH          = round(statistic_INTELEGENCE / 2);
is_active_heal            = false;
alarm[0]                  = 30;
idle_speed                = random_range(0.5, 2);
#endregion