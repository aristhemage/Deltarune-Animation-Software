function format_text(){
	// Only format the text once
	if (!formatted_text_done){
    
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
			

			
				if(!command){
					cur_width += string_width(cur_char);
				}
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
						// Only cut it off if the final word has three or more letters left
						if(string_length(text) - 3 > char + 3){
							if(string_char_at(text,char + 1) != " " && string_char_at(text,char + 2) != " " && string_char_at(text,char + 3) != " "){	
								new_text += "-\n   " // Cut off the word, new line
								cur_width = 0;
								char_over = 0;
							}
						}
					
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
}