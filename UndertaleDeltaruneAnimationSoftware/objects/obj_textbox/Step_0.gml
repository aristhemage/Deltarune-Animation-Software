// Only format the text once
if (!formatted_text_done){
    
	// Wrap text and add the *
    var max_width = has_face ? 750-spacing*75 : 950-spacing*75 ;
    var indent = string_width("* ") + 6;

	// Loop through every message in the dialogue array
    for (var i = 0; i < array_length(txt); i++){
        var text = txt[i];
		var new_text = "* ";
		var char = 1;
		var cur_width = 0;
		var command = false;

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
				if(string_char_at(text,char) == " "){
					new_text += "\n  "; // Spaces for indentation
					cur_width = 0;
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

// Handle sprite changes in the overworld
if(change_sprite_when_talking && message_no < array_length(txt)){

	var actor_id = get_actor_by_id(is_array(actor) ? actor[message_no]: actor);

	actor_id.sprite_index = overworld_sprite_arr[message_no];
	actor_id.auto_animate_walk = false;
	actor_id.image_speed = sprite_spd_arr[message_no];
}

// Get the currently active message
var current_text = formatted_text[message_no];

type_timer += 1;

if (type_timer >= type_speed){
	var cur_char = string_char_at(current_text,char_index)
	var command = false;
	if(cur_char == "["){
		command = true;
	}
	
	while(command){
		char_index++
		cur_char = string_char_at(current_text,char_index)
		if(cur_char == "]"){command = false}
	}
	// Add a slight delay after punctuation
	if(cur_char != "." && cur_char != "?" && cur_char != "!"){

		// Small pause for commas
		if(cur_char != ","){
			type_timer = 0;
		}else{
			type_timer = -2;	
		}

	// Larger pause for sentence-ending punctuation
	}else{
		type_timer = -4;	
	}

    if (char_index < string_length(current_text)){
        char_index += 1;
		
		// Play a blip every few texts
		if(audio_play > 0){
			audio_play--;	
		}else{
			if(is_array(snd)){
				audio_play_sound(snd[message_no],1,false)
			}else{
				audio_play_sound(snd,1,false)	
			}
			audio_play = 3;
		}
        show_txt = string_copy(current_text, 1, char_index);
    }
}
// If the full message has been displayed
if(char_index >= string_length(current_text)){

	// Count down until the next message appears
	next_message_timer--

	if(next_message_timer <= 0){

		// Move to the next message if there is one
		if(message_no < array_length(txt)-1){


			message_no++;

			// Reset typewriter variables
			show_txt = "";
			char_index = 0;
			next_message_timer = next_message_timer_int;

			// Reset animation frame if animated
			if(change_sprite_when_talking){
				var actor_id = get_actor_by_id(is_array(actor) ? actor[message_no]: actor);	
				actor_id.image_index = 0;
			}

		}else{
			
			// Restore normal actor animation style
			if(change_sprite_when_talking){
				var actor_id = get_actor_by_id(is_array(actor) ? actor[message_no]: actor);
				
				if(is_array(actor_id)){
					for (var i = 0; i < array_length(actor); i++){
						actor_id[message_no].auto_animate_walk = actor_id[message_no].auto_animate_walk_int;	
					}
				}
				actor_id.auto_animate_walk = actor_id.auto_animate_walk_int;
			}
			
			// No more dialogue, destroy textbox
			instance_destroy();	

		}
	}
}

// For testing purpouses Enter kills the textbox prematurley to go to the next cutscene section
if(keyboard_check_released(vk_enter)){
	instance_destroy();	
}

