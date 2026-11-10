var confirm_key = (keyboard_check_released(ord("Z")) || keyboard_check_released(vk_enter) || mouse_check_button_pressed(mb_left))
// Select actions
if(selectable){
	// Unclick box
	if(keyboard_check_released(vk_escape) || keyboard_check_released(ord("X"))){
		selected = false;	
		cursor_controller();
	}
	
	// Confirm selection
	if(selected && confirm_key ){
		selected = false;	
		cursor_controller();
		
		switch(type){
			case BOXTYPE.CREATE_ACTOR:
				instance_create_depth(mouse_x-sprite_get_width(spr_dummy)/2,mouse_y-sprite_get_height(spr_dummy)/2,1,obj_actor_placer);
			break;
			
			case BOXTYPE.CREATE_CHECKPOINT:
				instance_create_depth(mouse_x-sprite_get_width(spr_checkpoint)/2,mouse_y-sprite_get_height(spr_checkpoint)/2,1,obj_checkpoint_placer);
			break;
		}
	}
}


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
if(hover && mouse_check_button_pressed(mb_left)){
	
	if(selectable){
		selected = true;	
	}
}

if(selected){
	// Open Cutscene editor
	if(type == BOXTYPE.OPEN_CUTSCENE){
		selected = false;
		if(!obj_master.cutscene_open){
			var special_destroy_function = function (){
				obj_master.cutscene_open = false
			}
			cutscene_box = create_guibox(spr_action_box,window_get_width()/2,130,BOXTYPE.BACKGROUND,false,false,true, special_destroy_function);
			instance_create_depth(x,y,1,obj_cutscene_factory,{owner:cutscene_box});
			cutscene_box.image_xscale = 11
			cutscene_box.image_yscale = 13
			obj_master.cutscene_open = true;	
		}else{
			instance_destroy(cutscene_box)	
			obj_master.cutscene_open = false;
		}	
	}	
}

// Kill boxes in some scenarios
if (variable_instance_exists(id, "owner")) {

    // Close box when clicking outside both objects
    if (mouse_check_button_pressed(mb_left) && !hover) {

        // Check if mouse is hovering over the owner
        var over_owner = position_meeting(mouse_x, mouse_y, owner);
		
        if (!over_owner && destroy_click_off) {
            owner.box = -1;
            instance_destroy();
            exit;
        }
    }
}

// Fix the mouse in certain cenarios
if(confirm_key && window_get_cursor() == cr_none){
	cursor_controller(cr_arrow,true)	
}

