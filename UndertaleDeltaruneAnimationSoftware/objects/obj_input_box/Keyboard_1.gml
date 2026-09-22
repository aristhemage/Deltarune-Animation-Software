if (!selected) exit;

var key = keyboard_key;

// Only process the initial press
if (!keyboard_check_pressed(key)) exit;

// Start repeat timer
repeat_key = key;
repeat_timer = 0;

// Handle key
handle_input_key(key);