function build_dialogue(_text, _max_width){
    var lines = [];
    var line = "";
    var width = 0;

    var words = string_split(_text, " ");

    for (var i = 0; i < array_length(words); i++)
    {
        var word = words[i] + " ";
        var w = string_width(word);

        if (width + w > _max_width)
        {
            array_push(lines, line);
            line = word;
            width = w;
        }
        else
        {
            line += word;
            width += w;
        }
    }

    array_push(lines, line);

    return lines;
}