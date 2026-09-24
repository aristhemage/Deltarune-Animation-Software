function create_gui_checkbox(_x,_y,checked = false, _depth = -99,size = 1, owner = -1, exit_comm){
	instance_create_depth(_x,_y,_depth,obj_gui_checkbox,{checked, size, owner, exit_comm});
}