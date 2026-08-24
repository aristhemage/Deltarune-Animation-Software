action_queue = [];

//show_debug_message("========== QUEUE BUILD ==========");

for (var i = 0; i < array_length(obj_action_master.boxes); i++) {

    var box = obj_action_master.boxes[i];

    //show_debug_message(
    //    "QUEUE SOURCE | BOX ID: " + string(box.box_id) +
    //    " | COMMAND: " + string(box.command_name) +
    //    " | QUESTIONS: " + string(box.question_arr) +
    //    " | ANSWERS: " + string(box.answers_arr)
    //);
}

for (var i = 0; i < array_length(obj_action_master.boxes); i++) {
    var box = obj_action_master.boxes[i];

    array_push(action_queue, [
        box.command_name,
        box.answers_arr
    ]);
}

show_debug_message("FINAL QUEUE: " + string(action_queue));