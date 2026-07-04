// Move an object directly
function action_move(obj, target_x, target_y, spd) {
    return {
        type: ACTION.MOVE,
        obj,
        target_x,
        target_y,
        spd
    };
}

// Move an actor directly to space
function action_move_actor_direct(actor_id, target_x, target_y, spd) {
    return {
        type: ACTION.MOVE_ACTOR_DIRECT,
        actor: actor_id,
        target_x,
        target_y,
        spd
    };
}

// Move an actor starting by moving up/down or left/right, then doing the other after.
function action_move_actor_nondirect(actor_id, target_x, target_y, spd, prefer) {
    return {
        type: ACTION.MOVE_ACTOR_NONDIRECT,
        actor: actor_id,
        target_x,
        target_y,
        spd,
		prefer
    };
}

function action_wait_for_object(obj) {
    return {
        type: ACTION.WAIT_FOR_OBJECT,
        obj
    };
}

function action_wait_time(seconds) {
    return {
        type: ACTION.WAIT_TIME,
        time: seconds * room_speed
    };
}

function action_wait_for_var(object, variable, value) {
    return {
        type: ACTION.WAIT_FOR_VAR,
		object,
        variable,
        value
    };
}

function action_wait_for_var_greater(object, variable, value) {
    return {
        type: ACTION.WAIT_FOR_VAR_GREATER,
		object,
        variable,
        value
    };
}

function action_wait_for_var_less(object, variable, value) {
    return {
        type: ACTION.WAIT_FOR_VAR_LESS,
		object,
        variable,
        value
    };
}

function action_display_text(text, snd = snd_text, on_bottom = false, type_speed = 1, next_message_timer = 90, has_face = false, face_sprite = -1, face_id = -1, spacing = 2, change_sprite_when_talking = false, actor = -1, overworld_sprite_arr = -1, sprite_spd_arr = -1, darkworld = false) {
    return {
        type: ACTION.DISPLAY_TEXT,
        text,
		snd,
        type_speed,
		next_message_timer,
		has_face,
		face_sprite,
		face_id,
		spacing,
		change_sprite_when_talking,
		actor,
		overworld_sprite_arr,
		sprite_spd_arr,
		on_bottom,
		darkworld
    };
}

function action_create_object(obj, x, y, data = {}) {
    return {
        type: ACTION.CREATE_OBJECT,
        obj,
        x,
        y,
		data
    };
}

function action_destroy_object(obj) {
    return {
        type: ACTION.DESTROY_OBJECT,
        obj
    };
}

function action_destroy_actor(actor) {
    return {
        type: ACTION.DESTROY_ACTOR,
        actor
    };
}

function action_wait_for_object_destroy(obj) {
    return {
        type: ACTION.WAIT_FOR_OBJECT_DESTROY,
        obj
    };
}

function action_actor_change_sprite(actor, sprite, spd = 1){
	return {
		type: ACTION.ACTOR_CHANGE_SPRITE,
		actor,
		sprite,
		spd
	}
}

function action_play_sound(snd, wait_until_finish = false){
	return {
		type: ACTION.PLAY_SOUND,
		snd,
		wait_until_finish,
		sound_instance : undefined
	}
}

function action_actor_set_autowalk(actor, state){
	return{
		type: ACTION.ACTOR_SET_AUTOWALK,
		actor,
		state,
	}
}

function action_fade_object(obj) {
    return {
        type: ACTION.FADE_OBJECT,
        obj
    };
}

function action_goto_room(rm) {
    return {
        type: ACTION.GOTO_ROOM,
        rm
    };
}

function action_set_var(object, variable, val){
	return {
		type: ACTION.SET_VAR,
		object,
		variable,
		val
	}
}

function action_increment_var(object, variable){
	return {
		type: ACTION.INC_VAR,
		object,
		variable,
	}
}

function action_create_actor(actor_id, _x, _y, spawning_sprite, sprite_down = spr_dummy, sprite_right = spr_dummy, sprite_up = spr_dummy, sprite_left = spr_dummy, auto_animate_walk = false){
	return {
		type: ACTION.CREATE_ACTOR,
		actor_id,
		_x,
		_y,
		spawning_sprite,
		sprite_down,
		sprite_right,
		sprite_up,
		sprite_left,
		auto_animate_walk,
	}
}

function start_cutscene(actions) {
	if(!cutscene_active){
	    cutscene_active = true;
	    cutscene_queue = actions;
	    current_action = 0;
	    waiting = false;
	}
}