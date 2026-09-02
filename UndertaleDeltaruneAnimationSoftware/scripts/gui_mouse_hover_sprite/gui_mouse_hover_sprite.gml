/// @function gui_mouse_hover_sprite(x, y, sprite)
/// @returns {bool}

function gui_mouse_hover_sprite(_x, _y, _sprite) {
    var m_x = device_mouse_x_to_gui(0);
    var m_y = device_mouse_y_to_gui(0);

    return point_in_rectangle(
        m_x,
        m_y,
        _x,
        _y,
        _x + sprite_get_width(_sprite),
        _y + sprite_get_height(_sprite)
    );
}