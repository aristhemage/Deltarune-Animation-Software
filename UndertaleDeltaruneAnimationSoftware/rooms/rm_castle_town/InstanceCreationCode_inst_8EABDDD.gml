function cutscene(){
	with(obj_cutscene_master){
		var actions = [
				action_wait_time(0.25),
				action_play_sound(sng_my_castle_town),
				action_move_actor_direct("Susie",obj_checkpoint_a.x,obj_checkpoint_a.y,2,PREFER.VERT),
				action_actor_change_sprite("Susie",spr_susie_walk_up_dw,0),
				action_display_text(["Home sweet home, just as I \nremember it.", "Man, I cant wait for Noelle to show up."],snd_text_susie,false,1,100,true,spr_face_susie,[61,51],1,false,,,,true),
				action_wait_for_object_destroy(obj_textbox),
				action_actor_set_autowalk("Susie", true),
				action_create_actor("Ralsei",obj_checkpoint_b.x,obj_checkpoint_b.y,spr_ralsei_walk_down, spr_ralsei_walk_down,spr_ralsei_walk_right,spr_ralsei_walk_up,spr_ralsei_walk_left,true),
				action_move_actor_direct("Ralsei",obj_checkpoint_a.x, obj_checkpoint_a.y - 50,2),
				action_actor_change_sprite("Ralsei",spr_ralsei_wave_start,1),
				action_actor_wait_for_animation("Ralsei",spr_ralsei_wave_start),
				action_actor_change_sprite("Ralsei",spr_ralsei_wave,1),
				action_display_text(["Hey Susie!", "Glad you are back, by the way, I have a suprise!"],snd_text_ral,false,1,100,true,spr_face_ralsei,[3,18],1,false,,,,true),
				action_wait_for_object_destroy(obj_textbox),
				action_actor_change_sprite("Ralsei",spr_ralsei_walk_down,0),
				action_actor_set_autowalk("Ralsei",true),
				action_move_actor_nondirect("Ralsei",obj_checkpoint_c.x,obj_checkpoint_c.y,2,PREFER.HORZ),
				action_destroy_actor("Ralsei"),
				action_play_sound(snd_doorclose),
				action_wait_time(1.5),
				action_play_sound(snd_dooropen),
				action_create_actor("Ralsei",obj_checkpoint_c.x,obj_checkpoint_c.y,spr_ralsei_dress, spr_ralsei_dress,spr_ralsei_walk_right,spr_ralsei_walk_up,spr_ralsei_walk_left,true),
				action_move_actor_nondirect("Ralsei",obj_checkpoint_c.x,obj_checkpoint_c.y+100,2,PREFER.VERT),
				action_actor_set_autowalk("Susie",true),
				action_actor_show_exclamation("Susie"),
				action_move_actor_nondirect("Susie",obj_checkpoint_c.x,obj_checkpoint_c.y + 150, 4, PREFER.VERT),
				action_actor_change_sprite("Susie",spr_susie_walk_up_dw),
				action_wait_time(0.5),
				action_actor_change_sprite("Susie",spr_susie_headscratch_dw,1),
				action_display_text(["Woah man... you look..."],snd_text_susie,true,1,100,true,spr_face_susie,4,1,false,,,,true),
				action_wait_for_object_destroy(obj_textbox),
				action_actor_change_sprite("Susie",spr_susie_walk_up_dw),
				action_display_text(["Girly?"],snd_text_ral,true,1,100,true,spr_face_ralsei,6,1,false,,,,true),
				action_wait_for_object_destroy(obj_textbox),
				action_display_text(["Yeah... Does that mean... You want to be..."],snd_text_susie,true,1,100,true,spr_face_susie,13,1,false,,,,true),
				action_wait_for_object_destroy(obj_textbox),
				action_display_text(["I... Don't know, [s_1]maybe?", "I need more time to think\nabout it.", "[s_2]Would it be a problem if it was?"],snd_text_ral,true,1,100,true,spr_face_ralsei,[39,40,8],1,false,,,,true),	
				action_wait_for_object_destroy(obj_textbox),
				action_display_text(["Hey... Woah, no!", "Guy, girl, somewhere in\nbetween like [c_yellow]them[e], I dont care!","You still are a nerd no matter what"],snd_text_susie,true,1,100,true,spr_face_susie,[45,56,46],1,false,,,,true),
				action_wait_for_object_destroy(obj_textbox),
				action_actor_change_sprite("Susie",spr_susie_laugh_dw,1),
				action_actor_change_sprite("Ralsei",spr_ralsei_dress_spin,1),
				action_play_sound(snd_susie_laugh,true),
				action_actor_change_sprite("Susie",spr_susie_walk_up_dw),
				action_actor_change_sprite("Ralsei",spr_ralsei_dress),
				action_display_text(["Hehe, I will be your 'Nerd' for now.", "Now, let's get ready\nfor Noelle!"],snd_text_ral,true,1,100,true,spr_face_ralsei,[2,4],1,false,,,,true),	

				
				
				
			]
			
			
		start_cutscene(actions)
	}	
} 