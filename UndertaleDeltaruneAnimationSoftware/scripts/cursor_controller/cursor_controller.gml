function cursor_controller(type = cr_arrow, force = false){
	if(force){
		window_set_cursor(type);
		return;
	}
	switch(type){
		case cr_handpoint:
		case cr_arrow:
			if(window_get_cursor() == cr_beam){
				return;	
			}
		break;
	}
	
	window_set_cursor(type);

}