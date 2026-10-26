function search_feature(compare) {
    var search = string_lower(string_replace_all(string_trim(input), " ", "_"));
    results = [];

    if (search == "") return;

    var exact_match = false;

    for (var i = 0; i < array_length(compare); i++) {
        if (string_lower(compare[i]) == search) {
            exact_match = true;
            break;
        }
    }

    if (exact_match) return;

    for (var i = 0; i < array_length(compare); i++) {
        var name = compare[i];
        var normalized_name = string_lower(string_replace_all(name, " ", "_"));

        if (string_pos(search, normalized_name) > 0) array_push(results, name);
    }
}