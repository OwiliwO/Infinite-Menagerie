

function scr_percent() {
	if (argument0 <= 0) return false;
    if (argument0 >= 100) return true;
    
    return random(1) < (argument0 / 100);
}