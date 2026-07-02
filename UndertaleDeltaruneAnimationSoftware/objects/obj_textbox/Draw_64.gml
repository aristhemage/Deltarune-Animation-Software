draw_set_font(fnt_text);

var _x = 50;
var _y = on_bottom ? camera_get_view_height(0)-sprite_get_height(spr_lightworld_textbox) - 10: 10;

var offset_x = has_face ? sprite_get_width(is_array(face_sprite) ? face_sprite[message_no] : face_sprite) + 100 : 30;
var offset_y = 30;

draw_sprite(spr_lightworld_textbox, 0, _x, _y);

if (has_face){	
	
	// Face Sprite is an array (Multiple people are speaking)
	if(is_array(face_sprite)){
		
		// Face Id is an array (Same person speaking, different faces)
		if(is_array(face_id)){
		    draw_sprite(
		        face_sprite[message_no],
		        face_id[message_no]-1,
		        _x + sprite_get_width(face_sprite[message_no]) / 3,
		        _y + sprite_get_height(face_sprite[message_no]) / 3
		    );
		}else{
			
			// Face sprite is an array but face id remains the same
			draw_sprite(
		        face_sprite[message_no],
		        face_id-1,
		        _x + sprite_get_width(face_sprite[message_no]) / 3,
		        _y + sprite_get_height(face_sprite[message_no]) / 3
		    );
		}
	}else{
		
		// Face sprite is not an array, but face id is
		if(is_array(face_id)){
			 draw_sprite(
		        face_sprite,
		        face_id[message_no]-1,
		        _x + sprite_get_width(face_sprite) / 3,
		        _y + sprite_get_height(face_sprite) / 3
		    );	
		}else{
			// No arrays used
			draw_sprite(
		        face_sprite,
		        face_id-1,
		        _x + sprite_get_width(face_sprite) / 3,
		        _y + sprite_get_height(face_sprite) / 3
		    );		
		}
	}
}

draw_text_spaced(_x + offset_x, _y + offset_y, show_txt,spacing);