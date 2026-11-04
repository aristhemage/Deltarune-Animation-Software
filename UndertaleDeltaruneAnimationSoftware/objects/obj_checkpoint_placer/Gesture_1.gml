if (box == noone || box == -1) {
    obj_camera_focus_dot.zoom = 1;

    var pos = world_to_gui(x, y);
    box = create_guibox(spr_action_box, pos[0] + 96, pos[1] - 44, BOXTYPE.BACKGROUND, false, false, true);
    box.image_xscale = 4;
    box.image_yscale = 4;

    // Checkpoint Name
    create_gui_text(x + 30, y, "Checkpoint Name", -99, 0.5, fa_left, , , box);

    var name_box = instance_create_depth(x + 34, y + 15, -1, obj_input_box, {
        owner: box,
        input: checkpoint_id
    });

    name_box.results = [];
    name_box.result_boxes = [];
    name_box.search_options = [];

    name_box.exit_comm = method(name_box, function() {
        var checkpoint = find_original_owner(id);
        if (instance_exists(checkpoint)) checkpoint.checkpoint_id = input;
    });

   // Colour
	create_gui_text(x + 45, y + 35, "Colour", -99, 0.5, fa_left, , , box);

	var colour_box = instance_create_depth(x + 34, y + 48, -1, obj_input_box, {
	    owner: box,
	    input: colour_selected
	});

	colour_box.results = [];
	colour_box.result_boxes = [];
	colour_box.search_options = obj_master.colours;

	colour_box.exit_comm = method(colour_box, function() {
	    var checkpoint = find_original_owner(id);
	    if (!instance_exists(checkpoint)) return;

	    checkpoint.colour_selected = string_lower(input);

	    // Refresh colour search results.
	    search_feature(search_options);
	});

	colour_box.special_action = method(colour_box, function() {
	    var checkpoint = find_original_owner(id);
	    if (!instance_exists(checkpoint)) return;

	    var colour_name = "c_" + string_lower(input);
	    var col = turn_string_into_colour(colour_name);

	    if (col != -1) checkpoint.col = col;
	});

	colour_box.draw_callback = method(colour_box, function() {
	    draw_list(id);
	});
}