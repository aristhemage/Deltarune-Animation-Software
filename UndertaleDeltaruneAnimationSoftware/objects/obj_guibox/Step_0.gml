// Hover over box
if(gui_mouse_hover_sprite(_x,_y,spr_action_box)){
	hover = true;	
	image_index = 1;
	if (clickable)
		cursor_controller(cr_handpoint);
}else{
	hover = false;	
	image_index = 0;
	if (clickable)
		cursor_controller();
}

// Click box
if(hover && mouse_check_button_released(mb_left)){
	
	if(selectable){
		selected = true;	
	}
}

// Kill boxes in some scenarios
if (variable_instance_exists(id, "owner")) {

    // Close box when clicking outside both objects
    if (mouse_check_button_released(mb_left) && !hover) {

        // Check if mouse is hovering over the owner
        var over_owner = position_meeting(mouse_x, mouse_y, owner);

        if (!over_owner && destroy_click_off) {
            owner.box = -1;
            instance_destroy();
            exit;
        }
    }
}


if(selectable){
	
	// Unclick box
	if(keyboard_check_released(vk_escape) || keyboard_check_released(ord("X"))){
		selected = false;	
		cursor_controller();
	}
	
	// Confirm selection
	if(selected && (keyboard_check_released(ord("Z")) || keyboard_check_released(vk_enter) || mouse_check_button_pressed(mb_left))){
		selected = false;	
		cursor_controller();
		
		switch(type){
			case BOXTYPE.CREATE_ACTOR:
				instance_create_depth(mouse_x-sprite_get_width(spr_dummy)/2,mouse_y-sprite_get_height(spr_dummy)/2,1,obj_actor_placer);
			break;
		}
	}
}

