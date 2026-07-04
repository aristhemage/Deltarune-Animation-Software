// Auto Sprite
if (auto_animate_walk){
	if(x != xprevious || y != yprevious){
		image_speed = 1;
		// Prevents sliding
		if(!index_boost){
			image_index++;
			index_boost = true;
		}
	}
	
	if (x > xprevious)
	    sprite_index = sprite_right;
	else if (x < xprevious)
	    sprite_index = sprite_left;
	else if (y > yprevious)
	    sprite_index = sprite_down;
	else if (y < yprevious)
	    sprite_index = sprite_up;
	else if (x == xprevious && y == yprevious){
		image_index = 0;
		image_speed = 0;
		index_boost = false;
	}

}
depth = -y;


if(show_exclamation){
	exclamation_timer--;
	if(exclamation_timer <= 0){
		show_exclamation = false;
	}
}