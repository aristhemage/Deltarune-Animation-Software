function create_guibox(spr = spr_action_box, _x = 10,_y = 10,type = BOXTYPE.BACKGROUND,clickable = false,selectable = false,destroy_click_off = false){
	return instance_create_depth(x,y,1,obj_guibox,{owner: id, sprite_index: spr, _x,_y,type,clickable, selectable, destroy_click_off});
}