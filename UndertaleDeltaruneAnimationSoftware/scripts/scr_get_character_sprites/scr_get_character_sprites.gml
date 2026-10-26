function scr_get_character_sprites(character, darkworld = false) {
    var result = {};
    var suffix = darkworld ? "_dw" : "";

    for (var i = 0; i < array_length(obj_master.animation_actions); i++) {
        var action = obj_master.animation_actions[i];
        var sprite_name = "spr_" + character + "_" + action + suffix;
        var sprite = asset_get_index(sprite_name);

        result[$ action] = sprite;
    }

    return result;
}