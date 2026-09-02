if(gui_mouse_hover_sprite(10,10,spr_create_actor)){
	hover = true;	
	image_index = 1;
	window_set_cursor(cr_handpoint);
}else{
	hover = false;	
	image_index = 0;
	window_set_cursor(cr_arrow)
}

if(hover && mouse_check_button_released(mb_left)){
	selected = true;	
}

if(keyboard_check_released(vk_escape) || keyboard_check_released(ord("X"))){
	selected = false;	
	window_set_cursor(cr_arrow);
}

if(selected && (keyboard_check_released(ord("Z")) || keyboard_check_released(vk_enter) || mouse_check_button_pressed(mb_left))){
	selected = false;	
	window_set_cursor(cr_arrow);
	instance_create_depth(mouse_x-sprite_get_width(spr_dummy)/2,mouse_y-sprite_get_height(spr_dummy)/2,1,obj_actor_placer);
}