function cutscene(){
	with(obj_cutscene_master){
		var actions = [
				action_camera_follow_actor("Susie"),
				action_wait_time(1),
				action_play_sound(sng_my_castle_town),
				action_play_sound(snd_dooropen),
				action_create_actor("ral",99,99,spr_ralsei_walk_down,spr_ralsei_walk_down,spr_ralsei_walk_right,spr_ralsei_walk_up,spr_ralsei_walk_left,true,true,0.05),
				action_actor_follow_actor("ral","Susie"),
				action_move_actor_nondirect_checkpoint("Susie","chk1",2,PREFER.VERT),
				
				action_display_text(
					["Man, nothing like good music to put you in a good mood", "I liked the jingling of the bells on the festive parts.","Yeah! Makes me more excited for Noelle when she shows up."],
					[snd_text_susie, snd_text_ral,snd_text_susie,snd_text_susie,snd_text_ral,snd_text_susie],
					true,
					,
					120,
					true,
					[spr_face_susie, spr_face_ralsei, spr_face_susie],
					[10,3,23],
					,
					true,
					["Susie",noone,"Susie"],
					[spr_susie_walk_left_dw,noone,spr_susie_walk_down_dw],
					[0,0,0],
					true
				),
				action_wait_for_object_destroy(obj_textbox),
				action_actor_stop_following("ral"),
				action_actor_set_autowalk("Susie",true),
				action_move_actor_nondirect_checkpoint("Susie","chk2",2,PREFER.VERT),
				action_actor_change_sprite("ral",spr_ralsei_walk_left),
				
				action_display_text(
				["Say... isn't the music shop supposed to... [c_yellow]bounce?"],
				[snd_text_susie],
				true,
				[1],
				120,
				true,
				[spr_face_susie],
				[42],
				,
				true,
				["Susie"],
				[spr_susie_headscratch_dw],
				[1],
				true
				),
				
				action_wait_for_object_destroy(obj_textbox),
				
				action_actor_set_autowalk("Susie", true),
				action_move_actor_direct_checkpoint("Susie","chk3"),
				action_actor_change_sprite("Susie",spr_susie_twonk_dw),
				action_play_sound(snd_splat),
				action_display_text(
					["And what the [c_red][s_2]HECK[e] is going on here? Am I on TOP of the spike???"],
					snd_text_susie,
					true,
					,
					90,
					true,
					spr_face_susie,
					18,
					,
				),
				
				action_wait_for_object_destroy(obj_textbox),
				action_display_text(
				["Well, Susie, you DO know this isn't the [c_red]REAL[e] castle town, right?", "[s_2]What do you mean?", "Here... Close your eyes."],
				[snd_text_ral,snd_text_susie,snd_text_ral],
				true,
				[1,2,1],
				120,
				true,
				[spr_face_ralsei, spr_face_susie, spr_face_ralsei],
				[6,45,28],
				,
				true,
				["ral","Susie",noone],
				[spr_ralsei_walk_left,spr_susie_walk_right_dw,noone],
				[0,0,0],
				true
			),
			action_wait_for_object_destroy(obj_textbox),
			action_fade_out(0.05,-999),
			action_create_object(obj_code,320,250),
			action_wait_time(1),
				
			action_display_text(["We are in ArisTheMage's animation software.","Not even in Deltarune\nanymore...","Her code is... [c_red]bad[e].","Like how bad?","A desperate cry for help levels of bad!","But she'd love some help making the program better!","Anyone with at least one year of GML should totally contact her through Discord!","What on EARTH is that?","Haha. Kinda like the\nUndernet.","I see...","Wait... does that mean we're just part of some animation?","Yep! And when the animation is over, we cease to exist!","...Dang. That kinda sucks.","Hey, it's not all bad.","We'll be back someday.","Different form.","Different time."],
			[snd_text_ral,snd_text_ral,snd_text_ral,snd_text_susie,snd_text_ral,snd_text_ral,snd_text_ral,snd_text_susie,snd_text_ral,snd_text_susie,snd_text_susie,snd_text_ral,snd_text_susie,snd_text_ral,snd_text_ral,snd_text_ral,snd_text_ral],
			true
			,
			,
			120,
			true,
			[spr_face_ralsei,spr_face_ralsei,spr_face_ralsei,spr_face_susie,spr_face_ralsei,spr_face_ralsei,spr_face_ralsei,spr_face_susie,spr_face_ralsei,spr_face_susie,spr_face_susie,spr_face_ralsei,spr_face_susie,spr_face_ralsei,spr_face_ralsei,spr_face_ralsei,spr_face_ralsei],
			[0,0,18,20,5,5,21,42,4,3,28,7,23,1,21,1,1],
			),
			action_wait_for_object_destroy(obj_textbox),
			]
				
			
			
		start_cutscene(actions)
	}	
} 