/// @description Инициализация


event_inherited();

#region === ИНИЦИАЛИЗАЦИЯ ВИЗУАЛЬНЫХ ПАРАМЕТРОВ ===
sprite_index              = spr_enemy_wild_dog;
sprite_particles          = obj_particle_wild_dog;
image_index               = 0;
image_mask                = 11;
#endregion

#region === ИНИЦИАЛИЗАЦИЯ ОСНОВНЫХ ПАРАМЕТРОВ ===
description_NAMING        = "Wild dog"
description_ALL           = get_translate(global.translate_grid, "desc_ALL_wild_dog")
description_FEATURE       = get_translate(global.translate_grid, "desc_FTR_wild_dog")
death_phrase              = get_translate(global.translate_grid, "desc_deph_wild_dog")
statistic_STRENGTH        = 9;
statistic_AGILITY         = 6;
statistic_INTELEGENCE     = 3;
statistic_MAIN_ATTRIBUTE  = "STRENGTH"
statistic_INITIATIVE      = irandom(10);
alarm[0]                  = 30;
idle_speed                = random_range(0.5, 2);
#endregion
