function world_to_gui(_x, _y) {
    var cam = view_camera[0];

    var cam_x = camera_get_view_x(cam);
    var cam_y = camera_get_view_y(cam);
    var cam_w = camera_get_view_width(cam);
    var cam_h = camera_get_view_height(cam);

    var port_x = view_xport[0];
    var port_y = view_yport[0];
    var port_w = view_wport[0];
    var port_h = view_hport[0];

    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();

    var gui_x = (port_x + (_x - cam_x) * port_w / cam_w)
        * gui_w / window_get_width();

    var gui_y = (port_y + (_y - cam_y) * port_h / cam_h)
        * gui_h / window_get_height();

    return [gui_x, gui_y];
}