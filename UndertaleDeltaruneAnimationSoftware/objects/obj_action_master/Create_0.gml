buffer = 64;
start_x = 96;
start_y = 600;

default_xscale = 6.5;
default_yscale = 2;

next_id = 0;

// Ordered list of every action box.
boxes = [];

// Mouse dragging
mouse_cur = mouse_x;
dist = 0;
scroll_x = 0;

// Create the very first box.
create_box(0);

function create_box(insert_index){
	var box = instance_create_depth(0,start_y,1,obj_action_box, { image_xscale: default_xscale, image_yscale: default_yscale});

	box.box_id = next_id;
	next_id++;

	// Create this box's buttons.
	box.plus_button = instance_create_depth(0, 0, 2, obj_add_action_button, { owner: box });


	box.plus_button.owner = box;

	box.minus_button = instance_create_depth(0, 0, 2, obj_remove_action_button, { owner: box });
	box.minus_button.owner = box;

	array_insert(boxes, insert_index, box);

	recalculate_layout();

	return box;
}

function remove_box(box){
    var index = -1;

    for (var i = 0; i < array_length(boxes); i++){
        if (boxes[i] == box){
            index = i;
            break;
        }
    }

    if (index == -1)
        return;

    array_delete(boxes, index, 1);

    instance_destroy(box);

    recalculate_layout();
}

function recalculate_layout(){
    var xx = start_x + scroll_x;

    for (var i = 0; i < array_length(boxes); i++){
        var box = boxes[i];

        box.index = i;

        box.x = xx;
        box.y = start_y;

        var width = sprite_get_width(box.sprite_index) * box.image_xscale;

        xx += width + buffer;
    }
}

image_alpha = 0;
