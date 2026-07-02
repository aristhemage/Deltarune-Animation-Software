// Move an object directly
function action_move(obj, target_x, target_y, spd) {
    return {
        type: ACTION.MOVE,
        obj: obj,
        target_x: target_x,
        target_y: target_y,
        spd: spd
    };
}

// Move an actor directly to space
function action_move_actor_direct(actor_id, target_x, target_y, spd) {
    return {
        type: ACTION.MOVE_ACTOR_DIRECT,
        actor: actor_id,
        target_x: target_x,
        target_y: target_y,
        spd: spd
    };
}

// Move an actor starting by moving up/down or left/right, then doing the other after.
function action_move_actor_nondirect(actor_id, target_x, target_y, spd, prefer) {
    return {
        type: ACTION.MOVE_ACTOR_NONDIRECT,
        actor: actor_id,
        target_x: target_x,
        target_y: target_y,
        spd: spd,
		prefer: prefer
    };
}




function action_wait_for_object(obj) {
    return {
        type: ACTION.WAIT_FOR_OBJECT,
        obj: obj
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
		object: object,
        variable: variable,
        value: value
    };
}

function action_wait_for_var_greater(object, variable, value) {
    return {
        type: ACTION.WAIT_FOR_VAR_GREATER,
		object: object,
        variable: variable,
        value: value
    };
}

function action_wait_for_var_less(object, variable, value) {
    return {
        type: ACTION.WAIT_FOR_VAR_LESS,
		object: object,
        variable: variable,
        value: value
    };
}


function action_display_text(text, snd = snd_default_text , type_speed = 1,	next_message_timer = 90, has_face = false, face_sprite = -1, face_id = -1, spacing = 2, change_sprite_when_talking = false, actor = -1, overworld_sprite_arr = -1, sprite_spd_arr = -1) {
    return {
        type: ACTION.DISPLAY_TEXT,
        text: text,
		snd: snd,
        type_speed : type_speed,
		next_message_timer: next_message_timer,
		has_face : has_face,
		face_sprite: face_sprite,
		face_id: face_id,
		spacing: spacing,
		change_sprite_when_talking: change_sprite_when_talking,
		actor: actor,
		overworld_sprite_arr: overworld_sprite_arr,
		sprite_spd_arr: sprite_spd_arr
    };
}

function action_create_object(obj, x, y, data = {}) {
    return {
        type: ACTION.CREATE_OBJECT,
        obj: obj,
        x: x,
        y: y,
		data: data
    };
}
function action_destroy_object(obj) {
    return {
        type: ACTION.DESTROY_OBJECT,
        obj: obj
    };
}

function action_destroy_actor(actor) {
    return {
        type: ACTION.DESTROY_ACTOR,
        actor: actor
    };
}

function action_wait_for_object_destroy(obj) {
    return {
        type: ACTION.WAIT_FOR_OBJECT_DESTROY,
        obj: obj
    };
}
function action_actor_change_sprite(actor,sprite,spd = 1){
	return {
		type: ACTION.ACTOR_CHANGE_SPRITE,
		actor: actor,
		sprite: sprite,
		spd: spd
	}
}

function action_play_sound (snd, wait_until_finish = false){
	return {
		type: ACTION.PLAY_SOUND,
		snd: snd,
		wait_until_finish: wait_until_finish,
		sound_instance : undefined
	}
}

function action_actor_set_autowalk(actor, state){
	return{
		type: ACTION.ACTOR_SET_AUTOWALK,
		actor: actor,
		state: state,
	}
}

function action_fade_object(obj) {
    return {
        type: ACTION.FADE_OBJECT,
        obj: obj
    };
}

function action_goto_room(rm) {
    return {
        type: ACTION.GOTO_ROOM,
        rm: rm
    };
}

function action_set_var(object,variable,val){
	return {
		type: ACTION.SET_VAR,
		object: object,
		variable: variable,
		val: val
	}
}

function action_increment_var(object,variable){
		return {
		type: ACTION.INC_VAR,
		object: object,
		variable: variable,
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
