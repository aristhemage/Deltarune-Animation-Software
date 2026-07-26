var clip_x = 0;
var clip_y = 270;
var clip_w = 3000;
var clip_h = 310;
var draw_y = y - scroll_y;

_visible = draw_y + sprite_height * image_yscale > clip_y + 20
           && draw_y < clip_y + clip_h-20;
// Draw your scrolling content
draw_set_colour(c_white);
draw_set_font(fnt_text);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

gpu_set_scissor(clip_x, clip_y, clip_w, clip_h);
// Draw UI option
draw_sprite_ext(sprite_index, image_index, x, y-scroll_y,image_xscale,image_yscale,0,c_white,1);
draw_text_transformed(x, y - scroll_y, txt, 0.5, 0.5, 0);

gpu_set_scissor(-1, -1, -1, -1);