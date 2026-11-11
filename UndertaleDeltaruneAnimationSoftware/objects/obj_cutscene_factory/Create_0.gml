
if array_equals(obj_master.cutscene_data,[]){
	create_cutscene_node(window_get_width()/1.5,window_get_height()/2,ACTION.START_NODE,0,[],true)
	create_cutscene_node(window_get_width()/1.3,window_get_height()/2,ACTION.START_NODE,1,[],true)
}else{
	for(var i = 0; i <= array_length(obj_master.cutscene_data)-1; i++){
		create_cutscene_node(obj_master.cutscene_data[i][CUT_DATA_TYPE._X],obj_master.cutscene_data[i][CUT_DATA_TYPE._Y],obj_master.cutscene_data[i][CUT_DATA_TYPE.TYPE],obj_master.cutscene_data[i][CUT_DATA_TYPE.ID],obj_master.cutscene_data[i][CUT_DATA_TYPE.DATA])
	}
}

