/// @description Инициализация


event_inherited();

#region === ИНИЦИАЛИЗАЦИЯ ВИЗУАЛЬНЫХ ПАРАМЕТРОВ ===
sprite_index              = spr_rune_magic;
sprite_particles          = obj_particle_runes;
image_index               = 0;
image_mask                = 0;
#endregion

#region === ИНИЦИАЛИЗАЦИЯ ОСНОВНЫХ ПАРАМЕТРОВ ===
description_NAMING        = "Rune of Magic"
description_ALL           = get_translate(global.translate_grid, "desc_ALL_rune_magic")
description_FEATURE       = get_translate(global.translate_grid, "desc_FTR_rune_magic")
statistic_STRENGTH        = 2;
statistic_AGILITY         = 2;
statistic_INTELEGENCE     = 5;
statistic_MAIN_ATTRIBUTE  = "STRENGTH"
statistic_INITIATIVE      = irandom(10);
statistic_GOLD            = 20;
alarm[0]                  = 30;
idle_speed                = random_range(0.5, 2);
#endregion