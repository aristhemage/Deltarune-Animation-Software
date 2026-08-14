draw_set_colour(c_white);
draw_set_font(fnt_text);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_self();

if(smaller)
	draw_text_transformed(x-25, y + 20, txt, 0.45, 0.45, 0);
else
	draw_text_transformed(x-25, y + 20, txt, 0.5, 0.5, 0);
