// Camera settings
view_enabled = true;
view_visible[0] = true;

cam_width = 320;
cam_height = 240;

// Create camera
cam = camera_create_view(0, 0, cam_width, cam_height, 0, noone, -1, -1, -1, -1);
view_camera[0] = cam;

// Set window size
window_set_size(1280, 960);