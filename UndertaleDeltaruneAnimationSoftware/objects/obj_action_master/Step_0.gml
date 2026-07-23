// Move things
if(mouse_check_button(mb_left)){
	if(mouse_cur != mouse_x){
	    dist = mouse_x-mouse_cur;
		with(obj_action_box){
			x+= other.dist;	
		}
		with(obj_add_action_button){
			x+= other.dist;	
		}
	}
}

mouse_cur = mouse_x;