/// @description Обновление

if (instance_exists(object_id)) {
	if (object_id.statistic_HP == 0 || object_id.statistic_HP == object_id.statistic_MAX_HP) {
		object_id.statistic_HP = object_id.statistic_MAX_HP;
	} else {
		object_id.statistic_HP += (object_id.statistic_MAX_HP - object_id.statistic_OLD_MAX_HP);
	}
	if (object_id.statistic_MP >= object_id.statistic_MAX_MP) {
		object_id.statistic_MP = object_id.statistic_MAX_MP;
	} else {
		object_id.statistic_MP += (object_id.statistic_MAX_MP - object_id.statistic_OLD_MAX_MP);
	}
	if (object_id.statistic_AP >= object_id.statistic_MAX_AP) {
		object_id.statistic_AP = object_id.statistic_MAX_AP;
	} else {
		object_id.statistic_AP += (object_id.statistic_MAX_AP - object_id.statistic_OLD_MAX_AP);
	}

	object_id.statistic_OLD_HP = object_id.statistic_HP;
	
	object_id.statistic_OLD_MAX_HP = object_id.statistic_MAX_HP;
	object_id.statistic_OLD_MAX_MP = object_id.statistic_MAX_MP;
	object_id.statistic_OLD_MAX_AP = object_id.statistic_MAX_AP;
}
instance_destroy();