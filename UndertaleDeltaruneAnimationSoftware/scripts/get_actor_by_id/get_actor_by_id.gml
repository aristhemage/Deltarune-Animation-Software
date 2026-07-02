function get_actor_by_id(_actor_id){
    with (obj_actor){
        if (actor_id == _actor_id){
            return id;
        }
    }
	show_debug_message("Actor " + string(_actor_id) + " not found!")
    return noone;
}