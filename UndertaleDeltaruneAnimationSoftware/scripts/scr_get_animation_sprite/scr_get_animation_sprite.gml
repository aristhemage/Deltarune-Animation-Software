function scr_get_animation_sprite(sprites, action) {
    if (!variable_struct_exists(sprites, action)) {
        return -1;
    }

    return sprites[$ action];
}
