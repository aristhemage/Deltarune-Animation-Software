if (cutscene_active) {
    if (!waiting) {
        var action = cutscene_queue[current_action];
        switch (action.type) {
			
			//Move an object, continue cutscene when object reaches destination
			case ACTION.MOVE:

			    var obj = action.obj;
			    var tx = action.target_x;
			    var ty = action.target_y;
			    var spd = action.spd;

			    // Make sure obj is valid
			    if (!instance_exists(obj)) {
			        show_message("MOVE ERROR: Target object doesn't exist. If you see this please contact\nThe developer ArisTheMage over Discord.");
			        current_action += 1;
			        break;
			    }

			    // Get direction and distance
			    var dx = tx - obj.x;
			    var dy = ty - obj.y;
			    var dist = point_distance(obj.x, obj.y, tx, ty);

			    if (dist > spd) {
			        // Move toward target
			        obj.x += spd * (dx / dist);
			        obj.y += spd * (dy / dist);
			    } else {
			        // Snap to position and move to next action
			        obj.x = tx;
			        obj.y = ty;
			        current_action += 1;
			    }
			break;
			
			case ACTION.MOVE_CHECKPOINT:
					var obj = action.obj;
					var checkpoint = get_checkpoint_by_id(action.checkpoint_id)
				    var tx = checkpoint.x;
				    var ty = checkpoint.y;
				    var spd = action.spd;

				    // Make sure obj is valid
				    if (!instance_exists(obj)) {
				        show_message("MOVE ERROR: Target object doesn't exist. If you see this please contact\nThe developer ArisTheMage over Discord.");
				        current_action += 1;
				        break;
				    }

				    // Get direction and distance
				    var dx = tx - obj.x;
				    var dy = ty - obj.y;
				    var dist = point_distance(obj.x, obj.y, tx, ty);

				    if (dist > spd) {
				        // Move toward target
				        obj.x += spd * (dx / dist);
				        obj.y += spd * (dy / dist);
				    } else {
				        // Snap to position and move to next action
				        obj.x = tx;
				        obj.y = ty;
				        current_action += 1;
				    }
			break;
			
			//Move an actor nondirectly, continue cutscene when object reaches destination
			case ACTION.MOVE_ACTOR_NONDIRECT:
				var actor =  get_actor_by_id(action.actor);
			    var tx = action.target_x;
			    var ty = action.target_y;
			    var spd = action.spd;

			    // Make sure obj is valid
			    if (!instance_exists(obj_actor)) {
			        show_message("MOVE ERROR: Target object doesn't exist. If you see this please contact\nThe developer ArisTheMage over Discord.");
			        current_action += 1;
			        break;
			    }

			    //Get preference
				if(action.prefer == PREFER.HORZ){
					// Move Left/Right First
					var dx = tx - actor.x;
					var dist = point_distance(actor.x, actor.y, tx, actor.y);
					
					if (dist > spd) {
				        // Move toward target
				        actor.x += spd * (dx / dist);
				    } else {
				        // Snap to position and move up/down
				        actor.x = tx;
						
						var dy = ty - actor.y;
						var dist = point_distance(actor.x, actor.y, actor.x, ty);
						
						if (dist > spd) {
					        // Move toward target
					        actor.y += spd * (dy / dist);
						}else{
							// Done
							actor.y = ty;
							current_action++;
						}
						
						
				    }
					
					
				}else{
				// Move Up/Down First
				var dy = ty - actor.y;
				var dist = point_distance(actor.x, actor.y, actor.x, ty);

				if (dist > spd){
			        // Move toward target
			        actor.y += spd * (dy / dist);
			    }else{
			        // Snap to position and move left/right
			        actor.y = ty;

			        var dx = tx - actor.x;
			        var dist = point_distance(actor.x, actor.y, tx, actor.y);

			        if (dist > spd){
			            // Move toward target
			            actor.x += spd * (dx / dist);
			        }else{
			            // Done
			            actor.x = tx;
			            current_action++;
			        }
			    }
			}
			
				
				
			break;

		case ACTION.MOVE_ACTOR_NONDIRECT_CHECKPOINT:
				var actor =  get_actor_by_id(action.actor);
				var checkpoint = get_checkpoint_by_id(action.checkpoint_id)
			    var tx = checkpoint.x;
			    var ty = checkpoint.y;
			    var spd = action.spd;

			    // Make sure obj is valid
			    if (!instance_exists(obj_actor)) {
			        show_message("MOVE ERROR: Target object doesn't exist. If you see this please contact\nThe developer ArisTheMage over Discord.");
			        current_action += 1;
			        break;
			    }

			    //Get preference
				if(action.prefer == PREFER.HORZ){
					// Move Left/Right First
					var dx = tx - actor.x;
					var dist = point_distance(actor.x, actor.y, tx, actor.y);
					
					if (dist > spd) {
				        // Move toward target
				        actor.x += spd * (dx / dist);
				    } else {
				        // Snap to position and move up/down
				        actor.x = tx;
						
						var dy = ty - actor.y;
						var dist = point_distance(actor.x, actor.y, actor.x, ty);
						
						if (dist > spd) {
					        // Move toward target
					        actor.y += spd * (dy / dist);
						}else{
							// Done
							actor.y = ty;
							current_action++;
						}
						
						
				    }
					
					
				}else{
				// Move Up/Down First
				var dy = ty - actor.y;
				var dist = point_distance(actor.x, actor.y, actor.x, ty);

				if (dist > spd){
			        // Move toward target
			        actor.y += spd * (dy / dist);
			    }else{
			        // Snap to position and move left/right
			        actor.y = ty;

			        var dx = tx - actor.x;
			        var dist = point_distance(actor.x, actor.y, tx, actor.y);

			        if (dist > spd){
			            // Move toward target
			            actor.x += spd * (dx / dist);
			        }else{
			            // Done
			            actor.x = tx;
			            current_action++;
			        }
			    }
			}
			
			break;
		//Move an actor directly, continue cutscene when object reaches destination
			case ACTION.MOVE_ACTOR_DIRECT:
			
				var actor =  get_actor_by_id(action.actor);
			    var tx = action.target_x;
			    var ty = action.target_y;
			    var spd = action.spd;

			    // Make sure obj is valid
			    if (!instance_exists(obj_actor)) {
			        show_message("MOVE ERROR: Target object doesn't exist. If you see this please contact\nThe developer ArisTheMage over Discord.");
			        current_action += 1;
			        break;
			    }

			    // Get direction and distance
			    var dx = tx - actor.x;
			    var dy = ty - actor.y;
			    var dist = point_distance(actor.x, actor.y, tx, ty);

			    if (dist > spd) {
			        // Move toward target
			        actor.x += spd * (dx / dist);
			        actor.y += spd * (dy / dist);
			    } else {
			        // Snap to position and move to next action
			        actor.x = tx;
			        actor.y = ty;
			        current_action += 1;
			    }
			break;
			
				case ACTION.MOVE_ACTOR_DIRECT_CHECKPOINT:
			
				var actor =  get_actor_by_id(action.actor);
				var checkpoint = get_checkpoint_by_id(action.checkpoint_id)
			    var tx = checkpoint.x;
			    var ty = checkpoint.y;
			    var spd = action.spd;

			    // Make sure obj is valid
			    if (!instance_exists(obj_actor)) {
			        show_message("MOVE ERROR: Target object doesn't exist. If you see this please contact\nThe developer ArisTheMage over Discord.");
			        current_action += 1;
			        break;
			    }

			    // Get direction and distance
			    var dx = tx - actor.x;
			    var dy = ty - actor.y;
			    var dist = point_distance(actor.x, actor.y, tx, ty);

			    if (dist > spd) {
			        // Move toward target
			        actor.x += spd * (dx / dist);
			        actor.y += spd * (dy / dist);
			    } else {
			        // Snap to position and move to next action
			        actor.x = tx;
			        actor.y = ty;
			        current_action += 1;
			    }
			break;
			
			// Textbox
			case ACTION.DISPLAY_TEXT:
				instance_create_depth(-999,-999,1,obj_textbox,{
					txt: action.text,
					snd: action.snd,
					type_speed : action.type_speed,
					next_message_timer: action.next_message_timer,
					has_face : action.has_face,
					face_sprite: action.face_sprite,
					face_id: action.face_id,
					next_message_timer_int: action.next_message_timer,
					spacing: action.spacing,
					change_sprite_when_talking: action.change_sprite_when_talking,
					actor: action.actor,
					overworld_sprite_arr: action.overworld_sprite_arr,
					sprite_spd_arr: action.sprite_spd_arr,
					on_bottom: action.on_bottom,
					darkworld: action.darkworld
				})
				current_action++;
			break;
		
			//Wait for object to exist
            case ACTION.WAIT_FOR_OBJECT:
                if (instance_exists(action.obj)) {
                    current_action += 1;
                }
             break;

			// Change an actors sprite
			case ACTION.ACTOR_CHANGE_SPRITE:
				var _actor = get_actor_by_id(action.actor)
				_actor.sprite_index = action.sprite
				_actor.image_speed = action.spd;
				_actor.image_index = 0;
				_actor.image_xscale = action.x_scale;
				_actor.image_yscale = action.y_scale;
				_actor.auto_animate_walk = false;
				current_action++;
			break;
			
			// Change the autowalk state
			case ACTION.ACTOR_SET_AUTOWALK:
				var _actor = get_actor_by_id(action.actor);
				_actor.auto_animate_walk = action.state;
				current_action++;
			break;
			
			//Wait a certain amount of time, measured in seconds, see else
            case ACTION.WAIT_TIME:
                waiting = true;
                wait_timer = action.time;
                break;
			
			// Wait for an actor to finish their animation
			case ACTION.ACTOR_WAIT_FOR_ANIMATION:
					var _actor = get_actor_by_id(action.actor);
					if(_actor.image_index >= _actor.image_number-1){
						current_action++;	
					}
				break;
			
			//Wait for variable to be a certain value
            case ACTION.WAIT_FOR_VAR:
                if (variable_instance_get(action.object, action.variable) == action.value) {
                    current_action += 1;
                }
                break;
			 case ACTION.WAIT_FOR_VAR_GREATER:
                if (variable_instance_get(action.object, action.variable) >= action.value) {
                    current_action += 1;
                }
                break;	
			 case ACTION.WAIT_FOR_VAR_LESS:
                if (variable_instance_get(action.object, action.variable) < action.value) {
                    current_action += 1;
                }
                break;	
			//Create an object 
		    case ACTION.CREATE_OBJECT:
		        instance_create_depth(action.x, action.y, 1, action.obj,action.data);
		        current_action += 1;
		        break;	
		    
			//Destroy an actor
			case ACTION.DESTROY_ACTOR:
				var actor =  get_actor_by_id(action.actor);
		        if (instance_exists(actor)) {
		            instance_destroy(actor);
		        }
		        current_action += 1; 
		        break;
			
			// Play a sound
			case ACTION.PLAY_SOUND:
				// Only play the sound once
				if (is_undefined(action.sound_instance)){
					action.sound_instance = audio_play_sound(action.snd, 1, false);
				}
				
				if (action.wait_until_finish){
					if (!audio_is_playing(action.sound_instance)){
						current_action++;
					}
				}
				else{
					current_action++;
				}
			break;
			
			case ACTION.EXCLAMATION:
				var _actor =  get_actor_by_id(action.actor);
				// Set the timer and start exclaming
				if(_actor.exclamation_timer == -99){
					_actor.exclamation_timer = action.exclamation_timer;
					_actor.show_exclamation = true;
				}
				
				// Play da sound
				if(action.play_sound){
					if (is_undefined(action.sound_instance)){
						action.sound_instance = audio_play_sound(snd_suprise, 1, false);
					}	
				}
				
				// If waiting to finish (Most cases)
				if (action.wait_until_finish){
					if (!_actor.show_exclamation){
						current_action++;
					}
				}

			break;
			//Fade out an object
			case ACTION.FADE_OBJECT:
		        if (instance_exists(action.obj)) {
		            action.obj.image_alpha -= action.fade_spd
					if(action.obj.image_alpha <= 0){
						instance_destroy(action.obj)	
					}
		        }
				
				if(action.wait_until_finish){
					if(!instance_exists(action.obj))
						current_action++; 
				}else{
					current_action++;	
				}
		        break;
				
			//Fade out an actor
			case ACTION.FADE_ACTOR:
				var _actor =  get_actor_by_id(action.actor);
				
		        _actor.fade = true;
				_actor.fade_spd = action.fade_spd
					
				if(action.wait_until_finish){
					if(!instance_exists(_actor))
						current_action++; 
				}else{
					current_action++;	
				}
		        break;
			//Wait for an object to be distroyed
		    case ACTION.WAIT_FOR_OBJECT_DESTROY:
		        if (!instance_exists(action.obj)) {
		            current_action += 1; 
		        }
		        break;
			
			
			//Set a variable value
		    case ACTION.SET_VAR:
			
		        variable_instance_set(action.object, action.variable, action.val);
		        current_action += 1; 
		        
		        break;
				
			// Create an actor
			case ACTION.CREATE_ACTOR:
				instance_create_depth(action._x, action._y, 1, obj_actor, {sprite_index: action.spawning_sprite, actor_id: action.actor_id, sprite_down: action.sprite_down, sprite_right: action.sprite_right, sprite_up: action.sprite_up, sprite_left: action.sprite_left, auto_animate_walk: action.auto_animate_walk, auto_animate_walk_int: action.auto_animate_walk, fade_in: action.fade_in, fade_spd: action.fade_spd});
				current_action++;
			break;
			
			case ACTION.CREATE_ACTOR_CHECKPOINT:
				var checkpoint = get_checkpoint_by_id(action.checkpoint_id)
				instance_create_depth(checkpoint.x, checkpoint.y, 1, obj_actor, {sprite_index: action.spawning_sprite, actor_id: action.actor_id, sprite_down: action.sprite_down, sprite_right: action.sprite_right, sprite_up: action.sprite_up, sprite_left: action.sprite_left, auto_animate_walk: action.auto_animate_walk, auto_animate_walk_int: action.auto_animate_walk, fade_in: action.fade_in, fade_spd: action.fade_spd});
				current_action++;
			break;
			
			//Increment variable value
		    case ACTION.INC_VAR:
			
		        variable_instance_set(action.object, action.variable, variable_instance_get(action.object,action.variable) + 1);
		        current_action += 1; 
		        
		        break;			
			
			// Fade out room
			case ACTION.FADE_OUT:
				obj_fade.fade_out = true;
				obj_fade.fade_spd = action.fade_spd;
				obj_fade.depth = action.dep;
				if(obj_fade.alpha >= 1){
					current_action++;	
				}
			break;
			
			// Fade out room
			case ACTION.ACTOR_SET_ALPHA:
				var _actor =  get_actor_by_id(action.actor);
				
				if(action.fade_to){
					_actor.fade_to = true;
					_actor.fade_spd = action.fade_spd
					_actor.alpha_goal = action.alpha
				}else{
					_actor.alpha = action.alpha
				}
				
				if(action.wait_until_finish){
					if(_actor.alpha == action.alpha){
						current_action++	
					}
				}else{
					current_action++;	
				}
				
			break;
				
			//Go to another room, SHOULD BE LAST IN CUTSCENE, 
			//SET UP NEW CUTSCENE IN OTHER ROOM
		    case ACTION.GOTO_ROOM:
					room_goto(action.rm)
				break;
			
			
        }
    } else {
        // Handle waiting
        if (wait_timer > 0) {
            wait_timer -= 1;
            if (wait_timer <= 0) {
                waiting = false;
                current_action += 1;
            }
        }
    }

    // End cutscene
    if (current_action >= array_length(cutscene_queue)) {
        cutscene_active = false;
		cutscene = -1;
    } 
}



