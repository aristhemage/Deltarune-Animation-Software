// Known bug, double tapping when already existing makes another one

var pos = world_to_gui(x,y)
box = create_guibox(spr_action_box,pos[0]+96,pos[1]-64,BOXTYPE.BACKGROUND,false,false,true);
box.image_xscale = 4;
box.image_yscale = 6;
exit_comm = function exit_command(){
	owner.owner.actor_id = input;
}

// Magic numbers I know but like, how else should I do it?
create_gui_text(x+35,y-30,"Actor Name",-99,0.5,fa_left,,,box)
instance_create_depth(x+34,y-20,-1,obj_input_box,{owner: box, exit_comm: exit_command, input:actor_id});

exit_comm = function exit_command_2(){
	find_original_owner(id).auto_walk = checked;	
}
create_gui_text(x+35,y,"Autowalk",-99,0.5,fa_left,,,box)
create_gui_checkbox(x+70,y+5,auto_walk,-99,2,box, exit_command_2);
