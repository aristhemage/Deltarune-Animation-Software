if (async_load[? "status"]) {
    answers_arr[current_question] = async_load[? "result"];
    
    current_question++;
    
    ask_next_question();
}