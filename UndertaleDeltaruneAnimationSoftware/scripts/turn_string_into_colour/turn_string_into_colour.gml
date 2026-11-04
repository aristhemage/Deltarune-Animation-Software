function turn_string_into_colour(colour_name) {
    switch (string_lower(colour_name)) {
        case "c_aqua":    return c_aqua;
        case "c_black":   return c_black;
        case "c_blue":    return c_blue;
        case "c_dkgray":  return c_dkgray;
        case "c_fuchsia": return c_fuchsia;
        case "c_gray":    return c_gray;
        case "c_green":   return c_green;
        case "c_lime":    return c_lime;
        case "c_ltgray":  return c_ltgray;
        case "c_maroon":  return c_maroon;
        case "c_navy":    return c_navy;
        case "c_olive":   return c_olive;
        case "c_orange":  return c_orange;
        case "c_purple":  return c_purple;
        case "c_red":     return c_red;
        case "c_silver":  return c_silver;
        case "c_teal":    return c_teal;
        case "c_white":   return c_white;
        case "c_yellow":  return c_yellow;
        default:          return -1;
    }
}