var pos = world_to_gui(x,y)
box = create_guibox(spr_action_box,pos[0]+96,pos[1]-64,BOXTYPE.BACKGROUND,false,false,true);
box.image_xscale = 4;
box.image_yscale = 6;
instance_create_depth(x+36,y-20,-1,obj_input_box)