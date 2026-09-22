function handle_input_key(key) {

    if (!selected) return;

    var ctrl = keyboard_check(vk_control);
    var shift = keyboard_check(vk_shift);

    var start_pos = min(selection_start, selection_end);
    var end_pos = max(selection_start, selection_end);

    var has_selection = start_pos != end_pos;

    // Select all
    if (ctrl && key == ord("A")) {
        selection_start = 1;
        selection_end = string_length(input) + 1;
        cursor_pos = selection_end;
        return;
    }

    // Copy
    if (ctrl && key == ord("C")) {
        if (has_selection) {
            clipboard_set_text(
                string_copy(input, start_pos, end_pos - start_pos)
            );
        }
        return;
    }

    // Cut
    if (ctrl && key == ord("X")) {
        if (has_selection) {

            clipboard_set_text(
                string_copy(input, start_pos, end_pos - start_pos)
            );

            input = string_delete(input, start_pos, end_pos - start_pos);

            cursor_pos = start_pos;
            selection_start = cursor_pos;
            selection_end = cursor_pos;
        }
        return;
    }

    // Paste
    if (ctrl && key == ord("V")) {

        var pasted = clipboard_get_text();

        var new_input = input;
        var insert_pos = cursor_pos;

        if (has_selection) {
            new_input = string_delete(new_input, start_pos, end_pos - start_pos);
            insert_pos = start_pos;
        }

        // Insert as much text as fits
        var inserted = "";


        for (var i = 1; i <= string_length(pasted); i++) {

            var char = string_char_at(pasted, i);

            var candidate = string_insert(
                inserted + char,
                new_input,
                insert_pos
            );

            if (string_width(candidate) * text_scale > max_text_width) {
                break;
            }

            inserted += char;
        }

        input = string_insert(inserted, new_input, insert_pos);

        cursor_pos = insert_pos + string_length(inserted);
        selection_start = cursor_pos;
        selection_end = cursor_pos;

        return;
    }

    // Backspace
    if (key == vk_backspace) {

        if (has_selection) {
            input = string_delete(input, start_pos, end_pos - start_pos);
            cursor_pos = start_pos;
        }
        else if (cursor_pos > 1) {
            input = string_delete(input, cursor_pos - 1, 1);
            cursor_pos--;
        }

        selection_start = cursor_pos;
        selection_end = cursor_pos;

        return;
    }

    // Delete
    if (key == vk_delete) {

        if (has_selection) {
            input = string_delete(input, start_pos, end_pos - start_pos);
            cursor_pos = start_pos;
        }
        else {
            input = string_delete(input, cursor_pos, 1);
        }

        selection_start = cursor_pos;
        selection_end = cursor_pos;

        return;
    }

    // Move cursor left
    if (key == vk_left) {

        if (!shift && has_selection) {
            cursor_pos = start_pos;
        }
        else {
            cursor_pos = max(1, cursor_pos - 1);
        }

        if (!shift) {
            selection_start = cursor_pos;
        }

        selection_end = cursor_pos;

        return;
    }

    // Move cursor right
    if (key == vk_right) {

        if (!shift && has_selection) {
            cursor_pos = end_pos;
        }
        else {
            cursor_pos = min(string_length(input) + 1, cursor_pos + 1);
        }

        if (!shift) {
            selection_start = cursor_pos;
        }

        selection_end = cursor_pos;

        return;
    }

    // Home
    if (key == vk_home) {
        cursor_pos = 1;

        if (!shift) {
            selection_start = cursor_pos;
        }

        selection_end = cursor_pos;

        return;
    }

    // End
    if (key == vk_end) {
        cursor_pos = string_length(input) + 1;

        if (!shift) {
            selection_start = cursor_pos;
        }

        selection_end = cursor_pos;

        return;
    }

	// Ignore modifier and special keys
	if (ctrl || key == vk_shift || key == vk_control || key == vk_alt) return;

	// Only allow printable keys (I had to google this, apparently there's no simple way)
	if (key < 32 ||(key > 40 && key < 48) ||(key > 57 && key < 65) ||(key > 90 && key < 96) ||key > 111) {
	    return;
	}

	// Type regular characters
	var char = keyboard_lastchar;


    if (string_length(char) == 1 && ord(char) >= 32) {

        var new_input = input;
        var insert_pos = cursor_pos;

        if (has_selection) {
            new_input = string_delete(new_input, start_pos, end_pos - start_pos);
            insert_pos = start_pos;
        }

        // Check text width
        var candidate = string_insert(char, new_input, insert_pos);

        draw_set_font(fnt_text);

        if (string_width(candidate) * text_scale <= max_text_width) {

            input = candidate;

            cursor_pos = insert_pos + 1;
            selection_start = cursor_pos;
            selection_end = cursor_pos;
        }
    }
}