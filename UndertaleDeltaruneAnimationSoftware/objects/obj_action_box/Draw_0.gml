draw_set_colour(c_white);
draw_set_font(fnt_text);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_self();
draw_text_transformed(x-32,y,command_name,0.5,0.5,0);
draw_text_transformed(x-32,y+32,command_extra,0.4,0.4,0);
draw_text_transformed(x-32,y+64,"Id: " +_id,0.4,0.4,0);
