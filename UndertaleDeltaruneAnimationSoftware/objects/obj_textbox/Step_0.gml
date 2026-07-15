format_text();

// Handle sprite changes in the overworld
if(change_sprite_when_talking && message_no < array_length(txt)){

	var actor_id = get_actor_by_id(is_array(actor) ? actor[message_no]: actor);
	show_debug_message(actor_id)
	if(actor_id != noone){
		actor_id.sprite_index = overworld_sprite_arr[message_no];
		actor_id.auto_animate_walk = false;
		actor_id.image_speed = sprite_spd_arr[message_no];
	}
}

// Get the currently active message
var current_text = formatted_text[message_no];

type_timer += 1;

var _type_speed = is_array(type_speed) ? type_speed[message_no] : type_speed;

if (type_timer >= _type_speed){
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
				if(actor_id != noone)
					actor_id.image_index = 0;
			}

		}else{
			
			// Restore normal actor animation style
			if(change_sprite_when_talking){
				var actor_id = get_actor_by_id(is_array(actor) ? actor[message_no]: actor);
				if(actor_id != noone){
					if(is_array(actor_id)){
						for (var i = 0; i < array_length(actor); i++){
							actor_id[message_no].auto_animate_walk = actor_id[message_no].auto_animate_walk_int;	
						}
					}
					actor_id.auto_animate_walk = actor_id.auto_animate_walk_int;
				}
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

