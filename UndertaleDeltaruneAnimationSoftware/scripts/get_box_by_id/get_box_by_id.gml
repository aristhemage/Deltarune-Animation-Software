function get_box_by_id(_id){
    for (var i = 0; i < array_length(boxes); i++){
        if (boxes[i].box_id == _id)
            return boxes[i];
    }

    return noone;
}