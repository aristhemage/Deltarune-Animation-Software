function draw_text_special(_x, _y, _text, _spacing){
    var xx = _x;
    var yy = _y;
	var command = false;
	var command_no = 0;

    for (var i = 1; i <= string_length(_text); i++){
        var ch = string_char_at(_text, i);

        // newline handling
        if (ch == "\n"){
            yy += string_height("A");
            xx = _x;
            continue;
        }
		
 
		if(ch == "["){ 
			command = true;
			command_text = ""
			continue;
		}
		if (ch == "]"){
		    command = false;
			
			
			// Colours
			if (string_copy(command_text, 1, 2) == "c_"){
			    var value = string_delete(command_text, 1, 2);

				switch(value){
				    case "black":   draw_set_color(c_black);   break;
				    case "white":   draw_set_color(c_white);   break;
				    case "gray":    draw_set_color(c_gray);    break;
				    case "silver":  draw_set_color(c_silver);  break;

				    case "red":     draw_set_color(c_red);     break;
				    case "maroon":  draw_set_color(c_maroon);  break;

				    case "yellow":  draw_set_color(c_yellow);  break;
				    case "olive":   draw_set_color(c_olive);   break;

				    case "lime":    draw_set_color(c_lime);    break;
				    case "green":   draw_set_color(c_green);   break;

				    case "aqua":    draw_set_color(c_aqua);    break;
				    case "teal":    draw_set_color(c_teal);    break;

				    case "blue":    draw_set_color(c_blue);    break;
				    case "navy":    draw_set_color(c_navy);    break;

				    case "fuchsia": draw_set_color(c_fuchsia); break;
				    case "purple":  draw_set_color(c_purple);  break;

				    case "orange":  draw_set_color(c_orange);  break;
				    case "pink":  draw_set_color(make_colour_rgb(255,209,220));  break;

				    default:
				        draw_set_color(hex_to_col(value));
				    break;
				}
			}
		    continue;
		}
		
		if(command){
		// Collect and eat up the command string
			command_text += ch;
			continue;
			
		}
		

		draw_text(xx, yy, ch);
        xx += string_width(ch) + _spacing;
    }
	draw_set_colour(c_white);
}