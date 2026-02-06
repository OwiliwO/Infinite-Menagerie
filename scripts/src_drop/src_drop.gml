

function src_drop(){
	var items = array_length_1d(argument2);
	
	if (items > 1)
	{
		var angleItems = 360/items;
		var angle = random(360);
		for (var i = 0; i < items; i++)
		{
			with (instance_create_layer(argument0, argument1, "Characters", argument2[i]))
			{
				direction = angle;
				spd = 0.75 + (items * 0.1) + random(0.1);
			}
			angle += angleItems;
		}
		
	} else instance_create_layer(argument0, argument1, "Characters", argument2[0]);
}