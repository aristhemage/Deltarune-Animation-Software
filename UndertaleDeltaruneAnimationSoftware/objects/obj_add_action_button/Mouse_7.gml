// Get the box that owns the clicked + button
var clicked_box = get_box_by_id(_id);

// Create the new box immediately to the right of it
var new_box = instance_create_depth(clicked_box.bbox_right + obj_action_master.buffer, clicked_box.y, 1, obj_action_box, {_id: string(obj_action_master.cur_id + 1), image_xscale: obj_action_master.default_xscale, image_yscale: obj_action_master.default_yscale});

// Create its + button
instance_create_depth(new_box.bbox_right - 80, obj_action_master._y - 64, 2, obj_add_action_button, {_id: new_box._id});
obj_action_master.cur_id++;

// Why + 18? Only god above knows, it makes it so new boxes being shifted arent being shifted too much or too little. It works. Dont touch.
var shift = clicked_box.bbox_right - clicked_box.bbox_left + 19;

// Move every box to the right of the clicked one
with (obj_action_box){
    if (id != new_box && x > clicked_box.x){
        x += shift;
    }
}

// Move every + button whose box is to the right of the clicked one
with (obj_add_action_button){
    var box = get_box_by_id(_id);

    if (box != noone && _id != new_box._id && box.x > clicked_box.x){
        x += shift;
    }
}