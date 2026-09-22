selected = false;
image_xscale = 5;
image_yscale = 5;

hover = false;
blink_timer = 0;
vis = true;

// Text editing
cursor_pos = string_length(input) + 1;
selection_start = cursor_pos;
selection_end = cursor_pos;
dragging = false;

// Text settings
text_scale = 0.5;
text_offset = 8;

// Calculate maximum text width
max_text_width = sprite_get_width(sprite_index) * image_xscale - text_offset * 2;

// Keyboard repeat
repeat_key = vk_nokey;
repeat_timer = 0;
repeat_delay = 24;
repeat_interval = 3;