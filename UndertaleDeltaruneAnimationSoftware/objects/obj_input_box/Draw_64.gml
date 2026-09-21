var pos = world_to_gui(x, y);

// Draw sprite
draw_sprite_ext(sprite_index, image_index, pos[0], pos[1], image_xscale, image_yscale, image_angle, image_blend, image_alpha);

// Draw text
draw_set_font(fnt_text);
draw_set_colour(c_white);
draw_set_halign(fa_left);

draw_text_transformed(pos[0] + 8, pos[1], input, 0.5, 0.5, 0);