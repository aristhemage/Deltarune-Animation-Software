function get_actor_by_id(_actor_id){
	if(_actor_id != false && _actor_id != -1 && _actor_id != noone){
	    with (obj_actor){
	        if (actor_id == _actor_id){
	            return id;
	        }
	    }
	}else{
		return noone;
	}
	show_debug_message("Actor " + string(_actor_id) + " not found!")
    return noone;
}