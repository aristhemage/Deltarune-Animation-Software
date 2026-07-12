// Manually walk
if(manual_override){
	if(keyboard_check(vk_up) || keyboard_check(ord("W"))){
		y -= 4;	
	}

	if (keyboard_check(vk_down) || keyboard_check(ord("S"))) {
	    y += 4;
	}

	if (keyboard_check(vk_left) || keyboard_check(ord("A"))) {
	    x -= 4;
	}

	if (keyboard_check(vk_right) || keyboard_check(ord("D"))) {
	    x += 4;
	}
}

// Following another actor
if(follow_actor){
	// Calculate this follower's index inside the leaders's history array
	if (array_length(following.pos_history) > spacing) {
        
	    // Grab the historical target coordinates
	    var _target_pos = following.pos_history[spacing];
        
	    // Instantly snap to the historical coordinate
	    x = _target_pos.x;
	    y = _target_pos.y;
	}

}

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

// Exclamanation
if(show_exclamation){
	exclamation_timer--;
	if(exclamation_timer <= 0){
		show_exclamation = false;
	}
}

// Fading
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



// Used for follow actor
if (x != xprevious || y != yprevious) {
    // Add current position to the start of the array
    array_insert(pos_history, 0, {x: x, y: y});
    
    // Trim the array so it doesn't grow infinitely
    if (array_length(pos_history) > max_history) {
        array_delete(pos_history, max_history, 1);
    }
}


