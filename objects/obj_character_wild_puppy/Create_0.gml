/// @description Инициализация


event_inherited();

#region === ИНИЦИАЛИЗАЦИЯ ВИЗУАЛЬНЫХ ПАРАМЕТРОВ ===
sprite_index              = spr_enemy_wild_puppy;
sprite_particles          = obj_particle_wild_puppy;
image_index               = 0;
image_mask                = 9;
#endregion

#region === ИНИЦИАЛИЗАЦИЯ ОСНОВНЫХ ПАРАМЕТРОВ ===
description_NAMING        = "Wild puppy"
description_ALL           = get_translate(global.translate_grid, "desc_ALL_wild_puppy")
description_FEATURE       = get_translate(global.translate_grid, "desc_FTR_wild_puppy")
death_phrase              = get_translate(global.translate_grid, "desc_deph_wild_puppy")
statistic_STRENGTH        = 6;
statistic_AGILITY         = 7;
statistic_INTELEGENCE     = 3;
statistic_MAIN_ATTRIBUTE  = "STRENGTH"
statistic_INITIATIVE      = irandom(10);
alarm[0]                  = 30;
idle_speed                = random_range(0.5, 2);

statistic_grow            = 2;

src_grow_buff(id, obj_character_wild_dog);
#endregion