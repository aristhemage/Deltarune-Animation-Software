if (selected) {
    input = keyboard_string;

    // Remove characters until the text fits
    while (string_width(input) > 300) {
        input = string_delete(input, string_length(input), 1);
    }

    keyboard_string = input;
}
else {
    // Prevent typing while not selected
    keyboard_string = "";
}


if(mouse_check_button_pressed(mb_left)){
	selected = false;
}
