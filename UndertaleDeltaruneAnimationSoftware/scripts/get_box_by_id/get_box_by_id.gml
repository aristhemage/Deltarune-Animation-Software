function get_box_by_id(_box_id){
    with (obj_action_box){
        if (_id == _box_id){
            return id;
        }
    }
	show_debug_message("box " + string(_box_id) + " not found!")
    return noone;
}