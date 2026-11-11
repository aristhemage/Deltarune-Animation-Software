function create_cutscene_node(_x,_y,type,node_id,data,write_to_data = false){
	instance_create_depth(_x,_y,-9999,obj_cutscene_node,{owner, menu_x: window_get_width()/2-64 ,menu_y:64,menu_width:666,menu_height:800,node_id,type,data})
	if (write_to_data){
		array_push(obj_master.cutscene_data,[node_id,type,_x,_y,data])
	}
}