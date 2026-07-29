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
		break;

	case ACTION.MOVE_CHECKPOINT:
		action_name = "Move Object to Checkpoint";
		command_extra = "Moves an object to a checkpoint.";
		break;

	case ACTION.MOVE_ACTOR_DIRECT:
		action_name = "Move Actor (Direct)";
		command_extra = "Moves an actor directly to an x y\nposition.";
		break;

	case ACTION.MOVE_ACTOR_DIRECT_CHECKPOINT:
		action_name = "Move Actor to Checkpoint\n(Direct)";
		command_extra = "Moves an actor directly to a checkpoint.";
		break;

	case ACTION.MOVE_ACTOR_NONDIRECT:
		action_name = "Move Actor";
		command_extra = "Moves an actor directly to an x y\nposition.";
		break;

	case ACTION.MOVE_ACTOR_NONDIRECT_CHECKPOINT:
		action_name = "Move Actor to Checkpoint";
		command_extra = "Moves an actor to a checkpoint.";
		break;

	case ACTION.WAIT_FOR_OBJECT:
		action_name = "Wait for Object to exist";
		command_extra = "Waits until an object exists.";
		break;

	case ACTION.WAIT_FOR_OBJECT_DESTROY:
		action_name = "Wait for Object to be\nDestroyed";
		command_extra = "Waits until an object is destroyed.";
		break;

	case ACTION.WAIT_TIME:
		action_name = "Wait Time";
		command_extra = "Pauses for a set time (Seconds).";
		break;

	case ACTION.WAIT_FOR_VAR:
		action_name = "Wait for Variable to be a\nvalue";
		command_extra = "Waits for a variable to be a certain value.";
		break;

	case ACTION.WAIT_FOR_VAR_GREATER:
		action_name = "Wait for Variable Greater\nThan";
		command_extra = "Waits until a variable is greater\nthan a given value.";
		break;

	case ACTION.WAIT_FOR_VAR_LESS:
		action_name = "Wait for Variable Less\nThan";
		command_extra = "Waits until a variable is less\nthan a given value.";
		break;

	case ACTION.DISPLAY_TEXT:
		action_name = "Display Textbox";
		command_extra = "Shows a textbox.";
		break;

	case ACTION.CREATE_OBJECT:
		action_name = "Create Object";
		command_extra = "Creates an object.";
		break;

	case ACTION.DESTROY_OBJECT:
		action_name = "Destroy Object";
		command_extra = "Destroys an object.";
		break;

	case ACTION.DESTROY_ACTOR:
		action_name = "Destroy Actor";
		command_extra = "Destroys an actor.";
		break;

	case ACTION.FADE_OBJECT:
		action_name = "Fade Object";
		command_extra = "Fades an object.";
		break;

	case ACTION.FADE_ACTOR:
		action_name = "Fade Actor";
		command_extra = "Fades an actor.";
		break;

	case ACTION.GOTO_ROOM:
		action_name = "Go to Room";
		command_extra = "Changes to another room.";
		break;

	case ACTION.SET_VAR:
		action_name = "Set Variable";
		command_extra = "Sets a variable.";
		break;

	case ACTION.INC_VAR:
		action_name = "Increment Variable";
		command_extra = "Increases a variable.";
		break;

	case ACTION.ACTOR_CHANGE_SPRITE:
		action_name = "Change Actor Sprite";
		command_extra = "Changes an actor sprite.";
		break;

	case ACTION.PLAY_SOUND:
		action_name = "Play Sound";
		command_extra = "Plays a sound.";
		break;

	case ACTION.ACTOR_SET_AUTOWALK:
		action_name = "Set Actor Auto Walk";
		command_extra = "Toggles actor auto walk.";
		break;

	case ACTION.CREATE_ACTOR:
		action_name = "Create Actor";
		command_extra = "Creates an actor.";
		break;

	case ACTION.CREATE_ACTOR_CHECKPOINT:
		action_name = "Create Actor at\nCheckpoint";
		command_extra = "Creates an actor at a checkpoint.";
		break;

	case ACTION.ACTOR_WAIT_FOR_ANIMATION:
		action_name = "Wait for Actor Animation";
		command_extra = "Waits for an animation.";
		break;

	case ACTION.EXCLAMATION:
		action_name = "Show Exclamation";
		command_extra = "Shows an exclamation.";
		break;

	case ACTION.FADE_OUT:
		action_name = "Fade Out";
		command_extra = "Fades the screen.";
		break;

	case ACTION.ACTOR_SET_ALPHA:
		action_name = "Set Actor Opacity";
		command_extra = "Sets actor opacity.";
		break;

	case ACTION.FOLLOW_ACTOR:
		action_name = "Actor Follow Actor";
		command_extra = "Makes one actor follow another.";
		break;

	case ACTION.MANUAL_OVERRIDE:
		action_name = "Manual Override";
		command_extra = "Overrides automatic control.";
		break;

	case ACTION.CAMERA_FOLLOW_ACTOR:
		action_name = "Camera Follow Actor";
		command_extra = "Makes the camera follow.";
		break;

	case ACTION.ACTOR_STOP_FOLLOWING:
		action_name = "Stop Following Actor";
		command_extra = "Stops an actor from following.";
		break;

	case ACTION.END_LIST:
		action_name = "End List (You shouldn't see this!)";
		command_extra = "Ends the action list.";
		break;

	default:
		action_name = "Unknown Action (You shouldn't see this!)";
		command_extra = "Unknown command.";
		break;
}

draw_text_transformed(x-5, y - scroll_y, action_name, 0.25, 0.25, 0);

gpu_set_scissor(-1, -1, -1, -1);