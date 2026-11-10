if(!instance_exists(owner)){
	instance_destroy();	
}

// Within box of main Cutscene GUI
with(owner){
	if(gui_mouse_hover_sprite(_x,_y,spr_action_box)){
		other.hover = true;
	}else{
		other.hover = false;	
	}
}

// Hovering the big box and ready to be yeeted around
if(hover && mouse_check_button_pressed(mb_middle)){
	dragging = true;
	last_mouse_x = mouse_x;
	last_mouse_y = mouse_y;

	velocity_x = 0;
	velocity_y = 0;
}

if(dragging){
    if(mouse_check_button(mb_middle)){
		// Get the distance between then and now
		var dx = mouse_x - last_mouse_x;
		var dy = mouse_y - last_mouse_y;
		
		// Add it to x and y then add drag
		x += dx * drag_multiplier;
		y += dy * drag_multiplier;

		// Add some velocity for realism (It just looks good ok?)
		velocity_x = dx * drag_multiplier;
		velocity_y = dy * drag_multiplier;

		last_mouse_x = mouse_x;
		last_mouse_y = mouse_y;
	}else{
	    dragging = false;
	}
}else{
	
	// Add dat velocity (And friction)
	x += velocity_x;
	y += velocity_y;

	velocity_x *= frict;
	velocity_y *= frict;
	
	// Zero it out
	if(abs(velocity_x) < 0.1) velocity_x = 0;
	if(abs(velocity_y) < 0.1) velocity_y = 0;
}