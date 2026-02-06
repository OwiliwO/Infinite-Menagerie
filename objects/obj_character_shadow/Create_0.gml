/// @description Инициализация


event_inherited();

#region === ИНИЦИАЛИЗАЦИЯ ВИЗУАЛЬНЫХ ПАРАМЕТРОВ ===
sprite_index              = spr_main_shadow;
sprite_particles          = obj_particle_shadow;
image_index               = 0;
image_mask                = 0;
#endregion

#region === ИНИЦИАЛИЗАЦИЯ ОСНОВНЫХ ПАРАМЕТРОВ ===
description_NAMING        = "Shadow"
description_ALL           = get_translate(global.translate_grid, "desc_ALL_shadow")
description_FEATURE       = get_translate(global.translate_grid, "desc_FTR_shadow")
statistic_STRENGTH        = 1;
statistic_AGILITY         = 1;
statistic_INTELEGENCE     = 1;
statistic_MAIN_ATTRIBUTE  = "AGILITY"
statistic_LIFE            = 1;
if (instance_exists(obj_character_main)) {
	statistic_STRENGTH = obj_character_main.statistic_STRENGTH;
	statistic_AGILITY = obj_character_main.statistic_AGILITY;
	statistic_INTELEGENCE = obj_character_main.statistic_INTELEGENCE;
	statistic_MAIN_ATTRIBUTE = obj_character_main.statistic_MAIN_ATTRIBUTE;
}
statistic_INITIATIVE      = irandom(10);
alarm[0]                  = 30;
idle_speed                = random_range(0.5, 2);
#endregion