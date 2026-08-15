function ask_next_question() {
    if (current_question < array_length(question_arr)) {
        get_string_async(question_arr[current_question], "");
    }
}

