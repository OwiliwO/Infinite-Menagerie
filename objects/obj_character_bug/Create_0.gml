/// @description Инициализация


event_inherited();

#region === ИНИЦИАЛИЗАЦИЯ ВИЗУАЛЬНЫХ ПАРАМЕТРОВ ===
sprite_index              = spr_enemy_bug;
sprite_particles          = obj_particle_bug;
image_index               = 0;
image_mask                = 1;
#endregion

#region === ИНИЦИАЛИЗАЦИЯ ОСНОВНЫХ ПАРАМЕТРОВ ===
description_NAMING        = "Bug"
description_ALL           = get_translate(global.translate_grid, "desc_ALL_bug")
description_FEATURE       = get_translate(global.translate_grid, "desc_FTR_bug")
death_phrase              = get_translate(global.translate_grid, "desc_deph_bug")
statistic_STRENGTH        = 5;
statistic_AGILITY         = 7;
statistic_INTELEGENCE     = 5;
statistic_MAIN_ATTRIBUTE  = "INTELEGENCE"
statistic_INITIATIVE      = irandom(10);
alarm[0]                  = 30;
idle_speed                = random_range(0.5, 2);
statistic_OLD_HP          = statistic_HP;
is_update_statistic       = false;
#endregion