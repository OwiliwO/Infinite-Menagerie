

function src_globalvariables(){
	cursor_sprite = spr_ui_cursor;
	
	// Глобальная переменная - все пройденные игры
	global.StaticticGames = [];
	
	// Глабальная переменная - определение хода одной из сторон,
	// где 0 - ход игрока, 1 - ход противника
	global.SlideSide = false;
	// Глобальная переменная - определение выбранной способности
	global.TypeAbility = "None";
	// Глобальная переменная - подсчет количества текущих волн
	global.CountWaves = 0;
	// Глобальная переменная - громкость музыки в игре
	global.SettingMusicVolume = 0.5;
	// Глобальная переменная - громкость звуковых эффектов в игре
	global.SettingSoundVolume = 0.5;
	// Глобальная переменная - полный экран
	global.SettingFullScreen = true;
	// Глобальная переменная - первый запуск игры на устройстве
	global.FirstPlayCheck = true;
	// Глобальная переменная - выбор основного атрибуа у игрока
	global.PlayerMainAttribute = "STRENGTH";
	
	// Переменные игрока под персонажей
	// Глобальная переменная - размер инвентаря
	global.PlayerInventorySize = 6;
	// Глобальная переменная - кол-во. золота
	global.PlayerGoldCount = 100;
	// Глобальная переменная - выбранный игроком первый персонаж
	global.PlayerType = 0;
	
	// Глобальные переменные для описания глобальных характеристик и положений
	// Глобальная переменная - ОЗ
	global.DescHP = "HP";
	// Глобальная переменная - ОК
	global.DescMP = "MP";
	// Глобальная переменная - ОД
	global.DescAP = "AP";
	// Глобальная переменная - Золото
	global.DescGold = "Gold";
}