if(keyboard_check_pressed(vk_enter)){
	txt[0] += "\n "	
}





if(keyboard_check_pressed(vk_anykey) && !keyboard_check_pressed(vk_tab) && !keyboard_check_pressed(vk_backspace)){
	txt_last = txt[0];
	formatted_text_done = false;	
	var added = string_length(keyboard_string);

	txt[0] = string_insert(keyboard_string, txt[0], current_pos);
	keyboard_string = "";

	current_pos += added;
	if(txt[0] != txt_last)
		current_pos++
	
}

// Deleting
if(keyboard_check(vk_backspace)){
	if(txt[0] != ""){
		if(delete_int_delay >= 0){
			delete_int_delay--;
			if(!delete_one_key){
				txt[0] = string_copy(txt[0],0,string_length(txt[0])-1);
				current_pos--;
				formatted_text_done = false;
				delete_one_key = true;
			}
		}else{
			if(delete_delay > 0){
				delete_delay--;	
			}else{
				txt[0] = string_copy(txt[0],0,string_length(txt[0])-1);
				current_pos--;
				formatted_text_done = false;
				delete_delay = 5;
			}
		}
	}
}else{
	delete_int_delay = 45;	
	delete_one_key = false;
	delete_delay = 0;
}
// Only format the text once
while (!formatted_text_done){
	
    
	// Wrap text and add the *
    var max_width = has_face ? 720-spacing*75 : 950-spacing*75 ;
    var indent = string_width("* ") + 6;

	// Loop through every message in the dialogue array
    for (var i = 0; i < array_length(txt); i++){
		
        var text = txt[i];
		var new_text = "* ";
		var char = 1;
		var cur_width = 0;
		var command = false;
		var char_over = 0;

		// Go through the message one character at a time
		for(var j = 0; j < string_length(text); j++){
			var cur_char = string_char_at(text,char)
			if(cur_char == "[") command = true; 
			if(cur_char == "]") command = false; 
			
			new_text += cur_char;
			

			
			if(!command)
				cur_width += string_width(cur_char);
			char++;

			// If we've gone past the allowed width, jump lines at the next space
			if(cur_width > max_width){
				char_over++
				if(string_char_at(text,char) == " "){
					new_text += "\n  "; // Spaces for indentation
					cur_width = 0;
					char_over = 0;
				}
				
				if(char_over == 3){
					new_text += "-\n   " // Cut off the word, new line
					cur_width = 0;
					char_over = 0;
				}
			}
			
			
			// Reset width if manual new line
			if(string_char_at(text,char-1) == "\n"){
				cur_width = 0;
				// Add some spaces for indentation
				new_text += "   ";
			}
		
		}

		// Store the formatted message
		formatted_text[i] = new_text;
		

    }

	formatted_text_done = true;
}
