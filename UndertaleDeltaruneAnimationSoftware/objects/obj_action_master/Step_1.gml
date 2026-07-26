if (mouse_check_button(mb_left)){

	if (mouse_cur != mouse_x){
	    dist = mouse_x - mouse_cur;
		if(dist + scroll_x < 0 && dist + scroll_x > -(475 * array_length(boxes)))
			scroll_x += dist;
	}

}

mouse_cur = mouse_x;

recalculate_layout();

if (keyboard_check_pressed(ord("R"))){
    room_restart();
}