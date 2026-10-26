if (box == noone || box == -1) {
    obj_camera_focus_dot.zoom = 1;

    var pos = world_to_gui(x, y);
    box = create_guibox(spr_action_box, pos[0] + 96, pos[1] - 64, BOXTYPE.BACKGROUND, false, false, true);
    box.image_xscale = 4;
    box.image_yscale = 6;

    // Actor Name
    create_gui_text(x + 35, y - 30, "Actor Name", -99, 0.5, fa_left, , , box);

    var name_box = instance_create_depth(x + 34, y - 20, -1, obj_input_box, {
        owner: box,
        input: actor_id
    });

    name_box.results = [];
    name_box.result_boxes = [];
    name_box.search_options = [];

    name_box.exit_comm = method(name_box, function() {
        var actor = find_original_owner(id);
        if (instance_exists(actor)) actor.actor_id = input;
    });

    // Autowalk
    create_gui_text(x + 35, y, "Autowalk", -99, 0.5, fa_left, , , box);

    exit_comm = function exit_command_2() {
        var actor = find_original_owner(id);
        if (instance_exists(actor)) actor.auto_walk = checked;
    };

    create_gui_checkbox(x + 70, y + 5, auto_walk, -99, 2, box, exit_command_2);

    // Character
    create_gui_text(x + 35, y + 15, "Character", -99, 0.5, fa_left, , , box);

    var character_box = instance_create_depth(x + 34, y + 30, -1, obj_input_box, {
        owner: box,
        input: character_selected
    });

    character_box.results = [];
    character_box.result_boxes = [];
    character_box.search_options = obj_master.list_chars;

    character_box.exit_comm = method(character_box, function() {
        var actor = find_original_owner(id);
        if (!instance_exists(actor)) return;

        actor.character_selected = input;

        // Refresh character search results.
        search_feature(search_options);

        // Find the sprite actions supported by this character.
        var valid_actions = [];
        var actions = obj_master.animation_actions;
        var sprites = scr_get_character_sprites(string_lower(input));

        for (var i = 0; i < array_length(actions); i++) {
            var action = actions[i];
            if (sprites[$ action] != -1) array_push(valid_actions, action);
        }

        // Update the sprite selector without changing the character selector.
        if (variable_instance_exists(actor, "sprite_box_ref") && instance_exists(actor.sprite_box_ref)) {
            actor.sprite_box_ref.search_options = valid_actions;
            actor.sprite_box_ref.results = [];
            actor.sprite_box_ref.result_boxes = [];
            actor.sprite_box_ref.input = actor.sprite_selected;
        }
    });

    character_box.draw_callback = method(character_box, function() {
        draw_list(id);
    });

    // Starting Sprite
    create_gui_text(x + 30, y + 50, "Starting Sprite", -19, 0.5, fa_left, , , box);
	

    var sprite_box = instance_create_depth(x + 34, y + 60, -1, obj_input_box, {
        owner: box,
        input: sprite_selected
    });

    sprite_box.results = [];
    sprite_box.result_boxes = [];
    sprite_box.search_options = [];
	
	sprite_box.special_action = function() {
	    var sprite_name = "spr_" + string_lower(character_selected) + "_" + string_lower(sprite_selected);
	    var sprite_id = asset_get_index(sprite_name);

	    if (sprite_id != -1) sprite_index = sprite_id;
	}
	
    sprite_box.exit_comm = method(sprite_box, function() {
        var actor = find_original_owner(id);
        if (instance_exists(actor)) actor.sprite_selected = input;

        search_feature(search_options);
    });

    sprite_box.draw_callback = method(sprite_box, function() {
        draw_list(id);
    });

    // Store the sprite input box on this actor placer instance.
    sprite_box_ref = sprite_box;
}