function get_box_by_id(_id){
    for (var i = 0; i < array_length(obj_action_master.boxes); i++){
        if (obj_action_master.boxes[i].box_id == _id)
            return obj_action_master.boxes[i];
    }

    return noone;
}