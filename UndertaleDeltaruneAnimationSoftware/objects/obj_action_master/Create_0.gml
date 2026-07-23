buffer = 64;
_x = 96;
_y = 600;
default_xscale = 6.5;
default_yscale = 2;

cur_id = 0;
// Create the first box, then set the position for the next box at the end + some buffer
instance_create_depth(_x,_y,1,obj_action_box,{image_xscale: default_xscale, image_yscale: default_yscale, _id : "0"});
instance_create_depth(get_box_by_id("0").bbox_right-80,_y-64,2,obj_add_action_button,{ _id : "0"});

_x = get_box_by_id("0").bbox_right + buffer ;


mouse_cur = mouse_x;
dist = 0;