function get_checkpoint_by_id(_checkpoint_id){
    with (obj_checkpoint){
        if (checkpoint_id == _checkpoint_id){
            return id;
        }
    }
	show_debug_message("checkpoint " + string(_checkpoint_id) + " not found!")
    return noone;
}