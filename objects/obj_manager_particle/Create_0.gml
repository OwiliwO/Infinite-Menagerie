/// @description Инициализация


particleSystem = part_system_create();

#region === ИНИЦИАЛИЗАЦИЯ 'ПЫЛЬ' ===
particleDust = part_type_create();

part_type_sprite(particleDust, spr_particle_dust, 0, 0, 1);
part_type_size(particleDust, 2, 3, 0.01, 0);
part_type_direction(particleDust, 0,  359, 0, 1);
part_type_speed(particleDust, 0.1, 0.2, -0.004, 0);
part_type_life(particleDust, 10, 15);
part_type_orientation(particleDust, 0, 359, 0.1, 1, 0);
part_type_alpha3(particleDust, 0.8, 0.6, 0);

particleSmoke = part_type_create();

part_type_sprite(particleSmoke, spr_particle_dust, 0, 0, 1);
part_type_size(particleSmoke, 4, 4.5, 0.01, 0);
part_type_direction(particleSmoke, 0,  359, 0, 1);
part_type_speed(particleSmoke, 0.1, 0.2, -0.004, 0);
part_type_life(particleSmoke, 30, 35);
part_type_orientation(particleSmoke, 0, 359, 0.1, 1, 0);
part_type_alpha3(particleSmoke, 0.2, 0.1, 0);
#endregion

#region === ИНИЦИАЛИЗАЦИЯ 'ТЬМА' ===
particleDarkDust = part_type_create();

part_type_sprite(particleDarkDust, spr_particle_dark, 0, 0, 1);
part_type_size(particleDarkDust, 6, 8, 0.01, 0);
part_type_direction(particleDarkDust, 0,  359, 0, 1);
part_type_speed(particleDarkDust, 0.1, 0.2, -0.004, 0);
part_type_life(particleDarkDust, 10, 15);
part_type_orientation(particleDarkDust, 0, 359, 0.1, 1, 0);
part_type_alpha3(particleDarkDust, 0.8, 0.6, 0);

particleDarkSmoke = part_type_create();

part_type_sprite(particleDarkSmoke, spr_particle_dark, 0, 0, 1);
part_type_size(particleDarkSmoke, 10, 12, 0.01, 0);
part_type_direction(particleDarkSmoke, 0,  359, 0, 1);
part_type_speed(particleDarkSmoke, 0.1, 0.5, -0.004, 0);
part_type_life(particleDarkSmoke, 30, 35);
part_type_orientation(particleDarkSmoke, 0, 359, 0.1, 1, 0);
part_type_alpha3(particleDarkSmoke, 0.2, 0.1, 0);
#endregion

#region === ИНИЦИАЛИЗАЦИЯ 'ЗВУКОВЫЕ КОЛЬЦА' ===
particleDustCollapse = part_type_create();

part_type_shape(particleDustCollapse, pt_shape_ring);
part_type_size(particleDustCollapse, 0.2, 0.8, 0.08, 0);
part_type_scale(particleDustCollapse, 1, 1);
part_type_speed(particleDustCollapse, 0, 0, -0.05, 0);
part_type_life(particleDustCollapse, 60, 100);
part_type_orientation(particleDustCollapse, 0, 0, 0, 0, 1);
part_type_blend(particleDustCollapse, 0.3);
part_type_color2(particleDustCollapse, c_yellow, c_white);
part_type_alpha3(particleDustCollapse, 0.5, 0.4, 0);
#endregion

#region === ИНИЦИАЛИЗАЦИЯ 'ЯРОСТЬ' ===
particleRage = part_type_create();
particleRage_x = 0;
particleRage_y = 0;

part_type_sprite(particleRage, spr_particle_magic_strength, 0, 0, 1);
part_type_size(particleRage, 4, 4.5, 0.01, 0);
part_type_direction(particleRage, 90, 90, 0, 0);
part_type_speed(particleRage, 0.5, 1.0, -0.01, 0);
part_type_gravity(particleRage, 0, 270);
part_type_life(particleRage, 20, 30);
part_type_orientation(particleRage, 0, 359, 0.1, 1, 0);
part_type_alpha3(particleRage, 0.4, 0.8, 0);
#endregion

#region === ИНИЦИАЛИЗАЦИЯ 'БЛАГОСЛОВЕНИЕ' ===
particleImmortality = part_type_create();
particleImmortality_timer = 0;
particleImmortality_interval = 0.5;


part_type_sprite(particleImmortality, spr_particle_magic_blessing, 0, 0, 1);
part_type_size(particleImmortality, 4, 4.5, 0.01, 0);
part_type_direction(particleImmortality, 90, 90, 0, 0);
part_type_speed(particleImmortality, 0.5, 1.0, -0.01, 0);
part_type_gravity(particleImmortality, 0, 270);
part_type_life(particleImmortality, 20, 30);
part_type_orientation(particleImmortality, 0, 359, 0.1, 1, 0);
part_type_alpha3(particleImmortality, 0.5, 0.25, 0);
#endregion

#region === ИНИЦИАЛИЗАЦИЯ 'НАСЕКОМЫЕ' ===
particleInsects = part_type_create();

part_type_shape(particleInsects, pt_shape_pixel);
part_type_color3(particleInsects, c_dkgray, c_gray, c_ltgray);
part_type_size(particleInsects, 3, 3.5, 0.005, 0);
part_type_alpha2(particleInsects, 0.8, 0.4);
part_type_direction(particleInsects, 0, 360, 1, 140);
part_type_speed(particleInsects, 1.0, 3.0, 0.05, 0.5);
part_type_life(particleInsects, 150, 180);
part_type_gravity(particleInsects, 0.001, 270);
#endregion

#region === ИНИЦИАЛИЗАЦИЯ 'МАГИЯ' ===
particleMagic = part_type_create();

if (obj_parent_characters.statistic_MAIN_ATTRIBUTE == "STRENGTH") part_type_sprite(particleMagic, spr_particle_magic_strength, 0, 0, 1);
if (obj_parent_characters.statistic_MAIN_ATTRIBUTE == "INTELEGENCE") part_type_sprite(particleMagic, spr_particle_magic_intelegence, 0, 0, 1);
if (obj_parent_characters.statistic_MAIN_ATTRIBUTE == "AGILITY") part_type_sprite(particleMagic, spr_particle_magic_agility, 0, 0, 1);
part_type_size(particleMagic, 3, 5, 0.05, 0);
part_type_direction(particleMagic, 0,  359, 0, 1);
part_type_speed(particleMagic, 1, 2, -0.004, 0);
part_type_life(particleMagic, 20, 25);
part_type_orientation(particleMagic, 0, 359, 0.1, 1, 0);
part_type_alpha3(particleMagic, 0.8, 0.6, 0);
#endregion