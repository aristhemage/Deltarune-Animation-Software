function mouse_in_room(buffer = 0) {
    return mouse_x >= buffer
        && mouse_x < room_width - buffer
        && mouse_y >= buffer
        && mouse_y < room_height - buffer;
}