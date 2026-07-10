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

// Move an object to a checkpoint
function action_move_checkpoint(obj, checkpoint_id, spd) {
    return {
        type: ACTION.MOVE_CHECKPOINT,
        obj,
        checkpoint_id,
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

// Move an actor directly to checkpoint
function action_move_actor_direct_checkpoint(actor_id, checkpoint_id, spd) {
    return {
        type: ACTION.MOVE_ACTOR_DIRECT_CHECKPOINT,
        actor: actor_id,
        checkpoint_id,
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

// Same as above but to a checkpoint
function action_move_actor_nondirect_checkpoint(actor_id, checkpoint_id, spd, prefer) {
    return {
        type: ACTION.MOVE_ACTOR_NONDIRECT_CHECKPOINT,
        actor: actor_id,
        checkpoint_id,
        spd,
		prefer
    };
}

// Show an exclimation mark for a little bit
function action_actor_show_exclamation(actor,exclamation_timer = 60,wait_until_finish = true, play_sound = true){
	return{
		type: ACTION.EXCLAMATION,
		actor,
		exclamation_timer,
		wait_until_finish,
		play_sound,
		sound_instance : undefined
	}
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

function action_actor_change_sprite(actor, sprite, spd = 0, x_scale = 1, y_scale = 1){
	return {
		type: ACTION.ACTOR_CHANGE_SPRITE,
		actor,
		sprite,
		spd,
		x_scale,
		y_scale
	}
}
function action_actor_wait_for_animation(actor, sprite){
	return {
		type: ACTION.ACTOR_WAIT_FOR_ANIMATION,
		actor,
		sprite
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

function action_fade_object(obj,fade_spd = 0.05,wait_until_finish = false) {
    return {
        type: ACTION.FADE_OBJECT,
        obj,
		fade_spd,
		wait_until_finish
    };
}

function action_fade_actor(actor,fade_spd = 0.05, wait_until_finish = false) {
    return {
        type: ACTION.FADE_ACTOR,
        actor,
		fade_spd,
		wait_until_finish
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

function action_create_actor(actor_id, _x, _y, spawning_sprite, sprite_down = spr_dummy, sprite_right = spr_dummy, sprite_up = spr_dummy, sprite_left = spr_dummy, auto_animate_walk = false, fade_in = true, fade_spd = 0.05){
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
		fade_in,
		fade_spd
	}
}

function action_create_actor_checkpoint(actor_id, checkpoint_id, spawning_sprite, sprite_down = spr_dummy, sprite_right = spr_dummy, sprite_up = spr_dummy, sprite_left = spr_dummy, auto_animate_walk = false, fade_in = true, fade_spd = 0.05){
	return {
		type: ACTION.CREATE_ACTOR_CHECKPOINT,
		actor_id,
		checkpoint_id,
		spawning_sprite,
		sprite_down,
		sprite_right,
		sprite_up,
		sprite_left,
		auto_animate_walk,
		fade_in,
		fade_spd
	}
}

function action_fade_out(fade_spd = 0.05, dep = -9999){
	return {
		type: ACTION.FADE_OUT,
		fade_spd,
		dep
		
	}
}

function action_actor_set_alpha(actor, alpha,fade_to = false,fade_spd = 0.05,wait_until_finish = true){
	return {
		type: ACTION.ACTOR_SET_ALPHA,
		actor,
		alpha,
		fade_to,
		fade_spd,	
		wait_until_finish,
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