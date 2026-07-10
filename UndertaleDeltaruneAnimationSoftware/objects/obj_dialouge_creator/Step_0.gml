// Get the lines of the message (BROKEN)

for(var i = 0; i < string_length(formatted_text[0]); i++){
		lines[line_no] = string_copy(formatted_text[0],lastpos,i);
}


format_text();


if(keyboard_check_pressed(vk_enter) && line_no < 2){
	txt[0] = string_insert("\n", txt[0], current_pos);
	line_no++;
	lastpos = string_length(txt[0])
}

show_debug_message(lines)




if(keyboard_check(vk_anykey) && !keyboard_check_pressed(vk_tab) && !keyboard_check_pressed(vk_backspace) && !keyboard_check_pressed(vk_open_bracket) && !keyboard_check_pressed(vk_close_bracket) && line_no < 3){
	txt_last = txt[0];
	formatted_text_done = false;	
	var added = string_length(keyboard_string);

	txt[0] = string_insert(keyboard_string, txt[0], current_pos);
	line_width += string_width(keyboard_string);
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



