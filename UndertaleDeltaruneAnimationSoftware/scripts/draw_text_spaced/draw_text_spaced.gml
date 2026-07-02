function draw_text_spaced(_x, _y, _text, _spacing){
    var xx = _x;
    var yy = _y;

    for (var i = 1; i <= string_length(_text); i++){
        var ch = string_char_at(_text, i);

        // newline handling
        if (ch == "\n"){
            yy += string_height("A");
            xx = _x;
            continue;
        }

        draw_text(xx, yy, ch);

        xx += string_width(ch) + _spacing;
    }
}