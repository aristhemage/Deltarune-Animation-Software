function ask_next_question() {
    if (currentQuestion < array_length(questionArr)) {
        get_string_async(questionArr[currentQuestion], "");
    }
}

