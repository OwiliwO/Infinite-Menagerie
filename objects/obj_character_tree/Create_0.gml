/// @description Инициализация


event_inherited();

#region === ИНИЦИАЛИЗАЦИЯ ВИЗУАЛЬНЫХ ПАРАМЕТРОВ ===
sprite_index              = spr_enemy_tree;
sprite_particles          = obj_particle_environments;
image_index               = 0;
image_mask                = 0;
#endregion

#region === ИНИЦИАЛИЗАЦИЯ ОСНОВНЫХ ПАРАМЕТРОВ ===
description_NAMING        = "Grove"
description_ALL           = get_translate(global.translate_grid, "desc_ALL_grove")
description_FEATURE       = get_translate(global.translate_grid, "desc_FTR_grove")
death_phrase              = get_translate(global.translate_grid, "desc_deph_grove")
statistic_STRENGTH        = 14;
statistic_AGILITY         = 2;
statistic_INTELEGENCE     = 3;
statistic_MAIN_ATTRIBUTE  = "AGILITY"
statistic_INITIATIVE      = irandom(10);
alarm[0]                  = 30;
idle_speed                = 0;
#endregion