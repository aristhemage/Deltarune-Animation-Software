if(instance_exists(owner)){
	txt = owner.command_name;
	smaller = owner.smaller;
	x = owner.x + 250;
}else{
	instance_destroy();	
}

// Mouse position in GUI space
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Check if hovering
hovered = point_in_rectangle(mx, my,x-32,y - scroll_y, x + sprite_width+32,y - scroll_y + sprite_height);





image_index = hovered ? 1 :0;
