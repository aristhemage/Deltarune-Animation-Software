function draw_list(search_box,kill_underscores = true) {
    if (!instance_exists(search_box)) return;

    var count = min(array_length(search_box.results), 3);
    var pos = world_to_gui(search_box.x, search_box.y);

    search_box.result_boxes = [];

    for (var i = 0; i < count; i++) {
        var bx = pos[0];
        var by = pos[1] + (i * 50)+50;

        array_push(search_box.result_boxes, [bx, by]);

        draw_set_color(c_grey);
        draw_rectangle(bx, by, bx + 180, by + 45, false);

        draw_set_color(c_white);
		
		if (!kill_underscores) {
		    draw_text_transformed(bx + 5, by + 5, search_box.results[i], 0.5, 0.5, 0);
		} else {
		    var display_name = string_replace_all(search_box.results[i], "_", " ");
		    draw_text_transformed(bx + 5, by + 5, display_name, 0.5, 0.5, 0);
		}
    }
}