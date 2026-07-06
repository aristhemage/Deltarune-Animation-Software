draw_set_font(fnt_text);
draw_set_colour(c_white);
var textbox_sprite = darkworld ? spr_darkworld_textbox : spr_lightworld_textbox; 
var _x = 180;
var _y = 10;

var offset_x = has_face ? sprite_get_width(is_array(face_sprite) ? face_sprite[message_no] : face_sprite) + 100 : 30;
var offset_y = 40;

draw_sprite(textbox_sprite, 0, _x, _y);

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
draw_text_special(_x + offset_x, _y + offset_y, formatted_text[0],spacing);

draw_set_colour(c_white)
var caret_x = _x + offset_x + 60 + string_width(string_copy(txt[0], 1, current_pos)) + string_length(txt[0]);


blink_timer--;
if(blink_visible){
	draw_line_width(caret_x, _y +45,caret_x,_y + 100,4);
}

if(blink_timer <= 0){
	blink_timer = 45;	
	blink_visible = !blink_visible
}
