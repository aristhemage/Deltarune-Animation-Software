function world_to_gui(_x, _y) {
    var cam = view_camera[0];

    // Camera position
    var cam_x = camera_get_view_x(cam);
    var cam_y = camera_get_view_y(cam);

    // Camera dimensions
    var cam_w = camera_get_view_width(cam);
    var cam_h = camera_get_view_height(cam);

    // GUI dimensions
    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();

    // Convert world coordinates to GUI coordinates
    return [
        (_x - cam_x) * (gui_w / cam_w),
        (_y - cam_y) * (gui_h / cam_h)
    ];
}