if(!hover){
	image_index = 0;
}else{
	image_index = 1;	
}
// Keep the buttons attached to the action box.
if (instance_exists(plus_button)){
    plus_button.x = bbox_right - 80;
    plus_button.y = y - 64;
	if(plus_button.image_index == 1){
		image_index = 1;	
	}
}

if (instance_exists(minus_button)){
    minus_button.x = bbox_right - 160;
    minus_button.y = y - 64;
	if(minus_button.image_index == 1){
		image_index = 1;	
	}
}

if (instance_exists(action_list)){
    action_list.x = bbox_left+35;
    action_list.y = y - 300;
	if(action_list.image_index == 1){
		image_index = 1;	
	}
}

