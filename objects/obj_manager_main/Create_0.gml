/// @description Иницализация основного процесса игры


randomize();

#region === ИНИЦИАЛИЗАЦИЯ НАЧАЛА ИГРЫ ===
if (global.FirstPlayCheck) instance_create_layer(0, 0, "UI", obj_tooltip_education);
global.CountWaves = 0;
global.PlayerGoldCount = 100;
global.TypeAbility = "None";
global.SlideSide = false;
#endregion

#region === ИНИЦИАЛИЗАЦИЯ КАРТЫ И ГЛАВНОГО ПЕРСОНАЖА ===
depth = -1000;
instance_create_layer(0, 0, "Grid", obj_manager_map);
var manager = obj_manager_map;
var player = instance_create_layer(0, 0, "Characters", obj_character_main);
    
player.grid_x = manager.player_grid_x;
player.grid_y = manager.player_grid_y;
player.x = manager.grid_offset_x + player.grid_x * manager.cell_size + 8;
player.y = manager.grid_offset_y + player.grid_y * manager.cell_size - 20;
#endregion

#region === ИНИЦИАЛИЗАЦИЯ КАМЕРЫ И ЕЕ ПАРАМЕТРОВ ===
cam = view_camera[0];
vWidth = camera_get_view_width(cam) * 0.25;
vHeight = camera_get_view_height(cam) * 0.25;
x = camera_get_view_width(cam) / 4;
y = camera_get_view_height(cam) / 4;
is_shake = false;
shakeLength = 0;
shakeMagnitude = 0;
shakeRemain = 0;

function camera_shake(){
	if (argument0 > shakeRemain)
	{
		shakeMagnitude = argument0;
		shakeRemain = shakeMagnitude;
		shakeLength = argument1;
	}
	is_shake = true;
}
#endregion

#region === ИНИЦИАЛИЗАЦИЯ ДОПОЛНИТЕЛЬНЫХ ПЕРЕМЕННЫХ ===
current_try            = [];
current_actor          = noone;
current_wave           = 0;
current_enemies        = -1;
current_reward         = 0;
is_create_enemies      = false;
is_step_enemies        = false;
is_step_add_enemies    = false;
is_change_wave         = false;
is_game_end            = false;
blend_alpha            = 0;
blend_alpha_dead       = 0;
init_queue             = ds_priority_create();
init_queue_allies      = ds_priority_create();
init_queue_neutrals    = ds_priority_create();
multiplier             = 1;
#endregion

#region === ИНИЦИАЛИЗАЦИЯ ПРОКЛЯТЬЯ ===
function update_curse(_is_down = false) {
	if (current_wave + 1 >= 36) {
		with (obj_character_main) {
			var _statistic_CURSE = 0;
			if (statistic_MAIN_ATTRIBUTE == "STRENGTH") _statistic_CURSE = statistic_STRENGTH;
			if (statistic_MAIN_ATTRIBUTE == "AGILITY") _statistic_CURSE = statistic_AGILITY;
			if (statistic_MAIN_ATTRIBUTE == "INTELEGENCE") _statistic_CURSE = statistic_INTELEGENCE;
			
			_statistic_CURSE = _statistic_CURSE div 6;
			
			if (_statistic_CURSE == statistic_CURSE) {
				return false;
			}
			
			if (_is_down) {
				var _diff = statistic_CURSE - _statistic_CURSE;
				if (_diff > 0) {
					if (statistic_MAIN_ATTRIBUTE == "STRENGTH") statistic_INTELEGENCE += _diff * 3;
					if (statistic_MAIN_ATTRIBUTE == "AGILITY") { 
						statistic_INTELEGENCE += _diff * 2;
						statistic_STRENGTH += _diff * 2;
					}
					if (statistic_MAIN_ATTRIBUTE == "INTELEGENCE") statistic_STRENGTH += _diff * 3;
				}
				statistic_CURSE = _statistic_CURSE;
			} else {
				var _diff = _statistic_CURSE - statistic_CURSE;
				if (_diff > 0) {
					if (statistic_MAIN_ATTRIBUTE == "STRENGTH") statistic_INTELEGENCE -= _diff * 3;
					if (statistic_MAIN_ATTRIBUTE == "AGILITY") { 
						statistic_INTELEGENCE -= _diff * 2;
						statistic_STRENGTH -= _diff * 2;
					}
					if (statistic_MAIN_ATTRIBUTE == "INTELEGENCE") statistic_STRENGTH -= _diff * 3;
				}
				statistic_CURSE = _statistic_CURSE;
			}
			alarm[0] = 1;
		}
		return true;
	}
	
	return false;
}
#endregion