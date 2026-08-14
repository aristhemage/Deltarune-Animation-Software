if (async_load[? "status"]) {
    answersArr[currentQuestion] = async_load[? "result"];
    
    currentQuestion++;
    
    ask_next_question();
}