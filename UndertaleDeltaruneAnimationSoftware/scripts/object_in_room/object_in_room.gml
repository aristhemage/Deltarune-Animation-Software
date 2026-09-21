function object_in_room(obj, buffer = 0) {
    return obj.bbox_left >= buffer
        && obj.bbox_right < room_width - buffer
        && obj.bbox_top >= buffer
        && obj.bbox_bottom < room_height - buffer;
}