if(debug){
	if(keyboard_check_released(ord("R"))){
		room_restart();	
		audio_stop_all();
	}
}

if(keyboard_check_released(vk_f1)){
	debug = !debug;	
}