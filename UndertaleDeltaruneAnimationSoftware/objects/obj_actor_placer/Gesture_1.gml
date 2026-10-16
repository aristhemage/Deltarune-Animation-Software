// Known bug, zoom is borked, force zoom
if(box == noone || box == -1){
	obj_camera_focus_dot.zoom = 1;
	var pos = world_to_gui(x,y)
	box = create_guibox(spr_action_box,pos[0]+96,pos[1]-64,BOXTYPE.BACKGROUND,false,false,true);
	box.image_xscale = 4;
	box.image_yscale = 6;


	// Magic numbers I know but like, how else should I do it?
	
	// Name
	exit_comm = function exit_command(){
		find_original_owner(id).actor_id = input;
	}
	create_gui_text(x+35,y-30,"Actor Name",-99,0.5,fa_left,,,box)
	instance_create_depth(x+34,y-20,-1,obj_input_box,{owner: box, exit_comm: exit_command, input:actor_id});

	// Auto walk
	exit_comm = function exit_command_2(){
		find_original_owner(id).auto_walk = checked;	
	}
	create_gui_text(x+35,y,"Autowalk",-99,0.5,fa_left,,,box)
	create_gui_checkbox(x+70,y+5,auto_walk,-99,2,box, exit_command_2);
	
	// Character
	create_gui_text(x+35,y+15,"Character",-99,0.5,fa_left,,,box)
	
	// Search feature
	exit_comm = function exit_command_3() {
	    var owner = find_original_owner(id);
	    owner.character_selected = input;

	    var search = string_lower(input);
	    owner.results = [];

	    if (search != "") {
	        var exact_match = false;

	        // Hide results if the input exactly matches a character
	        for (var i = 0; i < array_length(obj_master.list_chars); i++) {
	            if (string_lower(obj_master.list_chars[i]) == search) {
	                exact_match = true;
	                break;
	            }
	        }

	        // Otherwise, show partial matches
	        if (!exact_match) {
	            for (var i = 0; i < array_length(obj_master.list_chars); i++) {
	                var name = obj_master.list_chars[i];

	                if (string_pos(search, string_lower(name)) > 0) {
	                    array_push(owner.results, name);
	                }
	            }
	        }
	    }
	};
	
	// Draw the list of options
	draw_callback = function search_callback() {
		var owner = find_original_owner(id);
		var count = min(array_length(owner.results), 3);
		var pos = world_to_gui(x, y);

		owner.result_boxes = [];

		for (var i = 0; i < count; i++) {
		    var bx = pos[0] + 140;
		    var by = pos[1] + (i * 50) + 140;

		    array_push(owner.result_boxes, [bx, by]);
			// Draw the boxes and text
		    draw_set_color(c_grey);
		    draw_rectangle(bx, by, bx + 180, by + 45, false);

		    draw_set_color(c_white);
		    draw_text_transformed(bx + 5, by + 5, owner.results[i], 0.5, 0.5, 0);
		}
	};


	var search_box = instance_create_depth(x+34,y+30,-1,obj_input_box,{owner: box, exit_comm: exit_command_3, input:character_selected , draw_callback});
	search_box.draw_callback = draw_callback;
}