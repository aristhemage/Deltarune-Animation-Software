function ask_next_question() {
    if (current_question < array_length(question_arr)) {
        dialog_id = get_string_async(question_arr[current_question], "");
    }
}