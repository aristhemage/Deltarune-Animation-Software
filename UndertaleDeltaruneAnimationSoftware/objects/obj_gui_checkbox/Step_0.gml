// Step
image_xscale = size;
image_yscale = size;
var pos = world_to_gui(x, y);

if (gui_mouse_hover_sprite(pos[0], pos[1])) {
    if (mouse_check_button_pressed(mb_left)) {
        checked = !checked;
		exit_comm();
    }
}

if(owner != -1){
	if(!instance_exists(owner)){
		instance_destroy();	
	}else{
		follow_original_owner();	
	}
}