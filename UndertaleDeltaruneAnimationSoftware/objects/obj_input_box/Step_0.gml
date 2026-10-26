var pos = world_to_gui(x, y);
var _mouse_gui_x = device_mouse_x_to_gui(0);

var text_x = pos[0] + text_offset;

// Check mouse hover
var hovering = gui_mouse_hover_sprite(pos[0], pos[1], sprite_index);

// Mouse click
if (mouse_check_button_pressed(mb_left)) {
	
	// Dragging and highlighting stuff
    if (hovering) {
		// Dont move the camera when typing
		if(obj_camera_focus_dot.controllable){
			holding_camera_hostage = true;
			obj_camera_focus_dot.controllable = false;
		}
		if(owner.destroy_click_off){
			holding_gui_box_hostage = true;
			owner.destroy_click_off = false;
		}
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
			
			if(holding_camera_hostage){holding_camera_hostage = false; obj_camera_focus_dot.controllable = true;}
        }

        dragging = false;
    }
}

// Send data to owner
if (instance_exists(owner)) {
    if (input != previous_input) {
	    previous_input = input;
	    exit_comm();
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

/// Click on search results

if (variable_instance_exists(id, "draw_callback") && is_callable(draw_callback)) {
    if (mouse_check_button_pressed(mb_left)) { 
        var mx = device_mouse_x_to_gui(0);
        var my = device_mouse_y_to_gui(0);
		

			var box_count = array_length(result_boxes);
			var result_count = array_length(results);
			var count = min(box_count, result_count);
		

	            for (var i = 0; i < count; i++) {
				var bx = result_boxes[i][0];
				var by = result_boxes[i][1];

					// Check if the click is inside this result's hitbox
	                if (mx >= bx && mx <= bx + 180 &&
	                    my >= by && my <= by + 45) { 
					
						// Select the matching character
	                    input = results[i]; 
	                    previous_input = input; 
	                    exit_comm(); // Apply the selected character
						if(holding_gui_box_hostage){
							holding_gui_box_hostage = false;
							owner.destroy_click_off = true;
						}
	                    break; // Stop checking other results
				}
			}
		}
}else{
	if(holding_gui_box_hostage){
		holding_gui_box_hostage = false;
		owner.destroy_click_off = true;
	}
}


if(!selected){
		if(holding_gui_box_hostage){
		holding_gui_box_hostage = false;
		owner.destroy_click_off = true;
	}
}


// Destroy if owner is gone
if (!instance_exists(owner)) {
    instance_destroy();
}else{
	follow_original_owner();
}

