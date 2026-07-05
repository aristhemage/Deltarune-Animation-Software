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

if(fade){
	if(image_alpha > 0){
		image_alpha -=fade_spd;	
	}else{
		instance_destroy();	
	}
}

if(fade_in){
	if(image_alpha < 1){
		image_alpha += fade_spd;	
	}else{
		image_alpha = 1;
		fade_in = false;
	}
}else{
	if(!fade){
		if(fade_to){
			if(image_alpha > alpha_goal){
				image_alpha -= fade_spd;	
			}else{
				image_alpha += fade_spd;	
			}
			
			if (abs(image_alpha - alpha_goal) < 0.01){
				fade_to = false;
				alpha = alpha_goal;
			}
		}else{
			image_alpha = alpha;	
		}
	}
}