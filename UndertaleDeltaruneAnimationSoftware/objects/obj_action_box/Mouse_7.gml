with(obj_action_list){
	instance_destroy();	
	action_list = noone
	
}

with(obj_action_settings){
	instance_destroy();	
	action_settings = noone;
}

var ac = instance_create_depth(bbox_left+35,y - 256,1,obj_action_list,{owner:id, image_xscale : 3.5, image_yscale: 5, box_id: box_id});	
var as = instance_create_depth(bbox_right-25,y - 400,1,obj_action_settings,{owner:id, image_xscale : 6.5, image_yscale: 5, box_id: box_id});	
action_list = ac;
action_settings = as;