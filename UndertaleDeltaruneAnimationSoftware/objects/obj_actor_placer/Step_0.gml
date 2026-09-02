if(selected && obj_actor_creator_master.actor_selected != id){
	selected = false;
}

if(mouse_check_button_released(mb_left)){
	selected = false;	
}

if(selected){
	x = mouse_x - sprite_width/2;
	y = mouse_y - sprite_height/2;
}