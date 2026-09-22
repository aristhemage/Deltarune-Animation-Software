var pos = world_to_gui(x, y);

var text_x = pos[0] + text_offset;
var text_y = pos[1];

draw_set_font(fnt_text);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Draw textbox
draw_sprite_ext(sprite_index, image_index, pos[0], pos[1], image_xscale, image_yscale, image_angle, image_blend, image_alpha);

// Draw selection highlight
if (selected && selection_start != selection_end) {

    var start_pos = min(selection_start, selection_end);
    var end_pos = max(selection_start, selection_end);

    var before = string_copy(input, 1, start_pos - 1);
    var highlighted = string_copy(input, start_pos, end_pos - start_pos);

    var highlight_x = text_x + string_width(before) * text_scale;
    var highlight_w = string_width(highlighted) * text_scale;

    draw_set_colour(c_blue);

    draw_rectangle(highlight_x, text_y, highlight_x + highlight_w, text_y + string_height("A") * text_scale, false);
}

// Draw text
draw_set_colour(c_white);

draw_text_transformed(text_x, text_y, input, text_scale, text_scale, 0);

// Draw blinking cursor
if (selected) {

    blink_timer++;

    if (blink_timer >= 30) {
        blink_timer = 0;
        vis = !vis;
    }

    if (vis) {

        var before_cursor = string_copy(input, 1, cursor_pos - 1);

        var cursor_x = text_x + string_width(before_cursor) * text_scale;

        draw_set_colour(c_white);

        draw_line(cursor_x, text_y, cursor_x, text_y + string_height("A") * text_scale);
    }
}