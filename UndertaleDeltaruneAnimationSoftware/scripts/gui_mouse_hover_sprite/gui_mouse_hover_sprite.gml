function gui_mouse_hover_sprite(_x, _y, _sprite) {
    var m_x = device_mouse_x_to_gui(0);
    var m_y = device_mouse_y_to_gui(0);

    // Get sprite dimensions with scaling with the sprite
    var width  = sprite_get_width(_sprite) * image_xscale;
    var height = sprite_get_height(_sprite) * image_yscale;

    // Get sprite origin with scaling
    var origin_x = sprite_get_xoffset(_sprite) * image_xscale;
    var origin_y = sprite_get_yoffset(_sprite) * image_yscale;

    // Calculate the actual sprite boundaries
    var left = _x - origin_x;
    var top  = _y - origin_y;

    var right  = left + width;
    var bottom = top + height;

    // Check if mouse is inside sprite boundaries (Finally fixed yay)
    return point_in_rectangle(
        m_x,
        m_y,
        min(left, right),
        min(top, bottom),
        max(left, right),
        max(top, bottom)
    );
}