draw_set_alpha(image_alpha);
draw_self();
if(show_exclamation)
	draw_sprite(spr_exclamation,0,x+sprite_get_width(sprite_index)/2,y-5);

draw_set_alpha(1);