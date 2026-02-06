

function SaveStatisticsGamesFunction() {
	var _saveSettingArray = array_create(0);
	
	array_push(_saveSettingArray, global.StaticticGames);
	
	var _fileName = "InfiniteMenagerieStatisticGamesavedate.sav";
	var _json = json_stringify(_saveSettingArray);
	var _buffer = buffer_create(string_byte_length(_json) + 1, buffer_fixed, 1);
	
	buffer_write(_buffer, buffer_string, _json);
	buffer_save(_buffer, _fileName);
	buffer_delete(_buffer);
}

function SaveSettingsFunction() {
	var _saveSettingArray = array_create(0);
	
	array_push(_saveSettingArray, global.language);
	array_push(_saveSettingArray, global.SettingFullScreen);
	array_push(_saveSettingArray, global.SettingMusicVolume);
	array_push(_saveSettingArray, global.SettingSoundVolume);
	array_push(_saveSettingArray, global.FirstPlayCheck);
	
	var _fileName = "InfiniteMenagerieSettingsavedate.sav";
	var _json = json_stringify(_saveSettingArray);
	var _buffer = buffer_create(string_byte_length(_json) + 1, buffer_fixed, 1);
	
	buffer_write(_buffer, buffer_string, _json);
	buffer_save(_buffer, _fileName);
	buffer_delete(_buffer);
}

function LoadStatisticsGamesFunction() {
	if (!file_exists("InfiniteMenagerieStatisticGamesavedate.sav")) { exit; } else {
		var _buffer = buffer_load("InfiniteMenagerieStatisticGamesavedate.sav");
		var _json = buffer_read(_buffer, buffer_string); buffer_delete(_buffer);
		var _loadArray = json_parse(_json);
	
		global.StaticticGames = array_get(_loadArray, 0);
	}
}

function LoadSettingsFunction() {
	if (!file_exists("InfiniteMenagerieSettingsavedate.sav")) { exit; } else {
		var _buffer = buffer_load("InfiniteMenagerieSettingsavedate.sav");
		var _json = buffer_read(_buffer, buffer_string); buffer_delete(_buffer);
		var _loadArray = json_parse(_json);
	
		global.language = array_get(_loadArray, 0);
		global.SettingFullScreen = array_get(_loadArray, 1);
		global.SettingMusicVolume = array_get(_loadArray, 2);
		global.SettingSoundVolume = array_get(_loadArray, 3);
		if (array_get(_loadArray, 4) == false) global.FirstPlayCheck = false;
	}
	window_set_fullscreen(global.SettingFullScreen);
}