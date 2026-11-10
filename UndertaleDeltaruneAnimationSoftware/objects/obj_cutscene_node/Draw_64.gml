// Define clipping rectangle
gpu_set_scissor(
    menu_x,
    menu_y,
    menu_width,
    menu_height
);

// Draw object
draw_self();

// Disable clipping afterward
gpu_set_scissor(0, 0, surface_get_width(application_surface), surface_get_height(application_surface));