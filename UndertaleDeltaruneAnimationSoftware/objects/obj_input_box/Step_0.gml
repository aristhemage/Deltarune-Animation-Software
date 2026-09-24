var pos = world_to_gui(x, y);
var _mouse_gui_x = device_mouse_x_to_gui(0);

var text_x = pos[0] + text_offset;

// Check mouse hover
var hovering = gui_mouse_hover_sprite(pos[0], pos[1], sprite_index);

// Mouse click
if (mouse_check_button_pressed(mb_left)) {
	
	// Dragging and highlighting stuff
    if (hovering) {
        selected = true;
        dragging = true;

        var local_x = (_mouse_gui_x - text_x) / text_scale;

        cursor_pos = 1;
			
        for (var i = 1; i <= string_length(input); i++) {
            var char_width = string_width(string_copy(input, 1, i));

            if (local_x >= char_width) {
                cursor_pos = i + 1;
            }
        }

        selection_start = cursor_pos;
        selection_end = cursor_pos;

        blink_timer = 0;
        vis = true;
    }
    else {
        if (selected) {
            selected = false;

            if (instance_exists(owner)) {
                exit_comm();
            }
        }

        dragging = false;
    }
}

// Drag to select
if (dragging && mouse_check_button(mb_left)) {

    var local_x = (_mouse_gui_x - text_x) / text_scale;

    cursor_pos = 1;

    for (var i = 1; i <= string_length(input); i++) {
        if (local_x >= string_width(string_copy(input, 1, i))) {
            cursor_pos = i + 1;
        }
    }

    selection_end = cursor_pos;
}

// Stop dragging
if (mouse_check_button_released(mb_left)) {
    dragging = false;
}

// Keyboard repeat
if (selected) {
    if (repeat_key != vk_nokey) {
		
        if (keyboard_check(repeat_key)) {
            repeat_timer++;
            if (repeat_timer >= repeat_delay) {
                if ((repeat_timer - repeat_delay) % repeat_interval == 0) {
					// LOOOOOONG custom function, middle click to see the beast.
                    handle_input_key(repeat_key);
                }
            }
        }
        else {
            repeat_key = vk_nokey;
            repeat_timer = 0;
        }
    }
}

// Change cursor
if (hovering) {
    hover = true;
    cursor_controller(cr_beam);
}
else {
    if (hover) {
        cursor_controller(cr_arrow, true);
        hover = false;
    }
}

// Destroy if owner is gone
if (!instance_exists(owner)) {
    instance_destroy();
}else{
	follow_original_owner();
}