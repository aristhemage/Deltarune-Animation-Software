// Known bug, double tapping when already existing makes another one

var pos = world_to_gui(x,y)
box = create_guibox(spr_action_box,pos[0]+96,pos[1]-64,BOXTYPE.BACKGROUND,false,false,true);
box.image_xscale = 4;
box.image_yscale = 6;
exit_comm = function exit_command(){
	owner.owner.actor_id = input;
}

create_gui_text(pos[0]+160,pos[1]-100,"Actor Name",-99,0.5,,,,box)
instance_create_depth(x+34,y-20,-1,obj_input_box,{owner: box, exit_comm: exit_command, input:actor_id});


create_gui_text(pos[0]+170,pos[1]-5,"Autowalk",-99,0.5,,,,box)
create_gui_checkbox(x+50,y+10,false,-99,,box)
