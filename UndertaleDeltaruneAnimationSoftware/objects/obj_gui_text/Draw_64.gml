draw_set_font(font);
draw_set_colour(col);
draw_set_halign(origin);
var pos = world_to_gui(x,y)

if(!snap_to_gui){
	draw_text_transformed(pos[0],pos[1],text,size,size,0);
}else{
	draw_text_transformed(x,y,text,size,size,0);
}