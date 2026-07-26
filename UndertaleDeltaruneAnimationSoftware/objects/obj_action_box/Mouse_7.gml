if(action_list == noone){
	var ac = instance_create_depth(bbox_left+35,y - 256,1,obj_action_list,{owner:id, image_xscale : 3.5, image_yscale: 5});	
	action_list = ac;

}else{
	instance_destroy(action_list);
	action_list = noone
}