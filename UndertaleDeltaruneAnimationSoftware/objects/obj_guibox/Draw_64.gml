draw_sprite_ext(sprite_index,image_index,_x,_y,image_xscale,image_yscale,image_angle,c_white,image_alpha)
draw_set_font(fnt_text)
draw_set_colour(c_white)
draw_set_halign(fa_center)

switch(type){
	case BOXTYPE.CREATE_ACTOR:	
		if(selected){
			draw_text_transformed(room_width/2,10,"Select where you want the actor to be",0.75,0.75,0);
			window_set_cursor(cr_none)
			draw_sprite(spr_crosshair,0,device_mouse_x_to_gui(0),device_mouse_y_to_gui(0));
		}
	break;
	default:
		//show_message("a")
	break;
}