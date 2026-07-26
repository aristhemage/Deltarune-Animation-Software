image_speed = 0;
for(var i = 0; i < ACTION.END_LIST; i++){
	instance_create_depth(x + 10,y - 75*i + 140,-2,obj_action_command,{type: i, txt: i, image_xscale: 3, owner: id, box_id: box_id, _id : i});
}