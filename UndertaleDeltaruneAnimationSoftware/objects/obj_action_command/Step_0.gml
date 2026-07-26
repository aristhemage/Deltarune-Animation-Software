if(instance_exists(owner)){
	x = owner.x + 10;
}else{
	instance_destroy();	
}

// Mouse position in GUI space
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Check if hovering
hovered = point_in_rectangle(mx, my,x,y - scroll_y, x + sprite_width,y - scroll_y + sprite_height);

// Click
if (hovered && mouse_check_button_released(mb_left) && _visible){
	get_box_by_id(box_id).command_name = _id;
}

image_index = hovered ? 1 :0;

// Scroll via click

if (mouse_check_button(mb_left) &&  distance_to_point(mouse_x,y) < 96){
    var dist = mouse_y - mouse_cur;

    scroll_y = clamp(scroll_y + dist, -ACTION.END_LIST * 67,0);

    
}
mouse_cur = mouse_y;
