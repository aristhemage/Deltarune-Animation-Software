function create_gui_text(_x,_y,text, _depth = -99,size = 1, origin = fa_center, col = c_white, font = fnt_text, owner = -1){
	instance_create_depth(_x,_y,_depth,obj_gui_text,{text, size, origin,col, font,owner});
}