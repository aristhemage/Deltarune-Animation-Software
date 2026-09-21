if(selected && obj_master.actor_selected != id){
	selected = false;
}

if(mouse_check_button_released(mb_left)){
	selected = false;	
}

if (selected) {
    // Calculate desired position
    var new_x = mouse_x + x_dist;
    var new_y = mouse_y + y_dist;

    // Calculate distance from origin to bounding box edges
    var left   = x - bbox_left;
    var right  = bbox_right - x;
    var top    = y - bbox_top;
    var bottom = bbox_bottom - y;

    // Keep the entire object inside the room with a 30px buffer
    x = clamp(new_x, 30 + left, room_width - 30 - right);
    y = clamp(new_y, 30 + top, room_height - 30 - bottom);
}

if(box != -1){
	var pos = world_to_gui(x,y)
	box._x = pos[0]+128;
	box._y = pos[1]-64;
	box.owner = id;
	box.destroy_click_off = true;
}
