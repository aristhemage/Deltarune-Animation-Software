var returned_id = async_load[? "id"];

if (returned_id != dialog_id) {
    exit;
}

if (async_load[? "status"]) {

    var answer = async_load[? "result"];

    if (current_question >= array_length(question_arr)) {
        exit;
    }

    //show_debug_message(
    //    "ANSWERING BOX ID: " + string(box_id) +
    //    " | QUESTION INDEX: " + string(current_question) +
    //    " | QUESTION: " + string(question_arr[current_question]) +
    //    " | ANSWER: " + string(answer)
    //);

    answers_arr[current_question] = answer;

    current_question++;

    ask_next_question();
}