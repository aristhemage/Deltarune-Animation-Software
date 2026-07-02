cam_width = 320 * obj_camera_focus_dot.zoom;
cam_height = 240 * obj_camera_focus_dot.zoom;
camera_set_view_size(cam,cam_width,cam_height)

if(instance_exists(obj_camera_focus)){
	var target_x = obj_camera_focus.x - cam_width / 2;
	var target_y = obj_camera_focus.y - cam_height / 2;

	var cam_x = camera_get_view_x(cam);
	var cam_y = camera_get_view_y(cam);

	camera_set_view_pos(
		cam,
		lerp(cam_x, target_x, 0.1),
		lerp(cam_y, target_y, 0.1)
	);
}