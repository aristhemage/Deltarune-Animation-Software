var clip_x = 0;
var clip_y = 270;
var clip_w = 3000;
var clip_h = 310;
var draw_y = y - scroll_y;
var buffer = 20
_visible = draw_y + sprite_height * image_yscale > clip_y + buffer
           && draw_y < clip_y + clip_h-buffer;
// Draw your scrolling content
draw_set_colour(c_white);
draw_set_font(fnt_text);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

gpu_set_scissor(clip_x, clip_y, clip_w, clip_h);
// Draw UI option
draw_sprite_ext(sprite_index, image_index, x, y-scroll_y,image_xscale,image_yscale,0,c_white,1);




switch (txt){
	case ACTION.MOVE:
		action_name = "Move Object";
		command_extra = "Moves an object to an x y\nposition.";
		question_arr = ["What object are you moving?", "X Position?", "Y Position?", "Speed?"];
		break;

	case ACTION.MOVE_CHECKPOINT:
		action_name = "Move Object to Checkpoint";
		command_extra = "Moves an object to a checkpoint.";
		question_arr = ["What object are you moving?", "Checkpoint ID?", "Speed?"];
		break;

	case ACTION.MOVE_ACTOR_DIRECT:
		action_name = "Move Actor (Direct)";
		command_extra = "Moves an actor directly to an x y\nposition.";
		question_arr = ["What actor are you moving?", "X Position?", "Y Position?", "Speed?"];
		break;

	case ACTION.MOVE_ACTOR_DIRECT_CHECKPOINT:
		action_name = "Move Actor to Checkpoint\n(Direct)";
		command_extra = "Moves an actor directly to a checkpoint.";
		question_arr = ["What actor are you moving?", "Checkpoint ID?", "Speed?"];
		break;

	case ACTION.MOVE_ACTOR_NONDIRECT:
		action_name = "Move Actor";
		command_extra = "Moves an actor directly to an x y\nposition.";
		question_arr = ["What actor are you moving?", "X Position?", "Y Position?", "Speed?", "Movement Preference (0 for vert, 1 for horz)?"];
		break;

	case ACTION.MOVE_ACTOR_NONDIRECT_CHECKPOINT:
		action_name = "Move Actor to Checkpoint";
		command_extra = "Moves an actor to a checkpoint.";
		question_arr = ["What actor are you moving?", "Checkpoint ID?", "Speed?", "Movement Preference (0 for vert, 1 for horz)?"];
		break;

	case ACTION.WAIT_FOR_OBJECT:
		action_name = "Wait for Object to exist";
		command_extra = "Waits until an object exists.";
		question_arr = ["What object should exist?"];
		break;

	case ACTION.WAIT_FOR_OBJECT_DESTROY:
		action_name = "Wait for Object to be\nDestroyed";
		command_extra = "Waits until an object is destroyed.";
		question_arr = ["What object should be destroyed?"];
		break;

	case ACTION.WAIT_TIME:
		action_name = "Wait Time";
		command_extra = "Pauses for a set time (Seconds).";
		question_arr = ["How many seconds?"];
		break;

	case ACTION.WAIT_FOR_VAR:
		action_name = "Wait for Variable to be a\nvalue";
		command_extra = "Waits for a variable to be a certain value.";
		question_arr = ["What object has the variable?", "Variable name?", "What value should it equal?"];
		break;

	case ACTION.WAIT_FOR_VAR_GREATER:
		action_name = "Wait for Variable Greater\nThan";
		command_extra = "Waits until a variable is greater\nthan a given value.";
		question_arr = ["What object has the variable?", "Variable name?", "What value should it reach?"];
		break;

	case ACTION.WAIT_FOR_VAR_LESS:
		action_name = "Wait for Variable Less\nThan";
		command_extra = "Waits until a variable is less\nthan a given value.";
		question_arr = ["What object has the variable?", "Variable name?", "What value should it be below?"];
		break;

	case ACTION.DISPLAY_TEXT:
		action_name = "Display Textbox";
		command_extra = "Shows a textbox.";
		question_arr = [
			"What text should be displayed?",
			"What sound should play?",
			"Show on bottom?",
			"Text speed?",
			"Time before next message?",
			"Show a face?",
			"Face sprite?",
			"Face ID?",
			"Letter spacing?",
			"Change sprite when talking?",
			"What actor is talking?",
			"Overworld sprite array?",
			"Sprite speed array?",
			"Use darkworld style?"
		];
		break;

	case ACTION.CREATE_OBJECT:
		action_name = "Create Object";
		command_extra = "Creates an object.";
		question_arr = ["What object should be created?", "X Position?", "Y Position?", "Instance data?"];
		break;

	case ACTION.DESTROY_OBJECT:
		action_name = "Destroy Object";
		command_extra = "Destroys an object.";
		question_arr = ["What object should be destroyed?"];
		break;

	case ACTION.DESTROY_ACTOR:
		action_name = "Destroy Actor";
		command_extra = "Destroys an actor.";
		question_arr = ["What actor should be destroyed?"];
		break;

	case ACTION.FADE_OBJECT:
		action_name = "Fade Object";
		command_extra = "Fades an object.";
		question_arr = ["What object should fade?", "Fade speed?", "Wait until finished?"];
		break;

	case ACTION.FADE_ACTOR:
		action_name = "Fade Actor";
		command_extra = "Fades an actor.";
		question_arr = ["What actor should fade?", "Fade speed?", "Wait until finished?"];
		break;

	case ACTION.GOTO_ROOM:
		action_name = "Go to Room";
		command_extra = "Changes to another room.";
		question_arr = ["What room should you go to?"];
		break;

	case ACTION.SET_VAR:
		action_name = "Set Variable";
		command_extra = "Sets a variable.";
		question_arr = ["What object has the variable?", "Variable name?", "New value?"];
		break;

	case ACTION.INC_VAR:
		action_name = "Increment Variable";
		command_extra = "Increases a variable.";
		question_arr = ["What object has the variable?", "Variable name?"];
		break;

	case ACTION.ACTOR_CHANGE_SPRITE:
		action_name = "Change Actor Sprite";
		command_extra = "Changes an actor sprite.";
		question_arr = ["What actor?", "What sprite?", "Animation speed?", "X Scale?", "Y Scale?"];
		break;

	case ACTION.PLAY_SOUND:
		action_name = "Play Sound";
		command_extra = "Plays a sound.";
		question_arr = ["What sound should play?", "Wait until sound finishes?"];
		break;

	case ACTION.ACTOR_SET_AUTOWALK:
		action_name = "Set Actor Auto Walk";
		command_extra = "Toggles actor auto walk.";
		question_arr = ["What actor?", "Enable auto walk?"];
		break;

	case ACTION.CREATE_ACTOR:
		action_name = "Create Actor";
		command_extra = "Creates an actor.";
		question_arr = [
			"Actor ID?",
			"X Position?",
			"Y Position?",
			"Starting sprite?",
			"Down sprite?",
			"Right sprite?",
			"Up sprite?",
			"Left sprite?",
			"Auto animate walk?",
			"Fade in?",
			"Fade speed?"
		];
		break;

	case ACTION.CREATE_ACTOR_CHECKPOINT:
		action_name = "Create Actor at\nCheckpoint";
		command_extra = "Creates an actor at a checkpoint.";
		question_arr = [
			"Actor ID?",
			"Checkpoint ID?",
			"Starting sprite?",
			"Down sprite?",
			"Right sprite?",
			"Up sprite?",
			"Left sprite?",
			"Auto animate walk?",
			"Fade in?",
			"Fade speed?"
		];
		break;

	case ACTION.ACTOR_WAIT_FOR_ANIMATION:
		action_name = "Wait for Actor Animation";
		command_extra = "Waits for an animation.";
		question_arr = ["What actor?", "What animation?"];
		break;

	case ACTION.EXCLAMATION:
		action_name = "Show Exclamation";
		command_extra = "Shows an exclamation.";
		question_arr = ["What actor?", "How long should it show?", "Wait until finished?", "Play sound?"];
		break;

	case ACTION.FADE_OUT:
		action_name = "Fade Out";
		command_extra = "Fades the screen.";
		question_arr = ["Fade speed?", "Depth?"];
		break;

	case ACTION.ACTOR_SET_ALPHA:
		action_name = "Set Actor Opacity";
		command_extra = "Sets actor opacity.";
		question_arr = ["What actor?", "Opacity?", "Fade to opacity?", "Fade speed?", "Wait until finished?"];
		break;

	case ACTION.FOLLOW_ACTOR:
		action_name = "Actor Follow Actor";
		command_extra = "Makes one actor follow another.";
		question_arr = ["Who follows?", "Who do they follow?", "Following spacing?", "Auto animate walk?"];
		break;

	case ACTION.MANUAL_OVERRIDE:
		action_name = "Manual Override";
		command_extra = "Overrides automatic control.";
		question_arr = ["What actor?", "Enable manual override?"];
		break;

	case ACTION.CAMERA_FOLLOW_ACTOR:
		action_name = "Camera Follow Actor";
		command_extra = "Makes the camera follow.";
		question_arr = ["What actor should the camera follow?"];
		break;

	case ACTION.ACTOR_STOP_FOLLOWING:
		action_name = "Stop Following Actor";
		command_extra = "Stops an actor from following.";
		question_arr = ["What actor should stop following?"];
		break;

	case ACTION.END_LIST:
		action_name = "End List (You shouldn't see this!)";
		command_extra = "Ends the action list.";
		question_arr = [];
		break;

	default:
		action_name = "Unknown Action (You shouldn't see this!)";
		command_extra = "Unknown command.";
		question_arr = [];
		break;
}

draw_text_transformed(x-5, y - scroll_y, action_name, 0.25, 0.25, 0);

