function cutscene(){
	with(obj_cutscene_master){
		var actions = [
				action_wait_time(1),
				action_move_actor_nondirect("Susie",obj_checkpoint_a.x,obj_checkpoint_a.y,2,PREFER.VERT),
				action_display_text(["Woah I cant beleive that over there is the true identiy of the roaring knight!"],snd_text_susie,false,1,120,true,spr_face_susie,8,2,false),
				action_wait_for_object_destroy(obj_textbox),
				action_actor_change_sprite("Susie",spr_susie_laugh),
				action_play_sound(snd_susie_laugh,true),
				action_actor_change_sprite("Susie",spr_susie_walk_right,0),
				action_display_text(["So glad I can see this, and not stuck in some game with a locked camera... That would be totally lame. Like... imagine!", "Anyway ima going to play uhh... Minecraft now...\n   Bye!"],snd_text_susie,false,1,120,true,spr_face_susie,[52,21],2,false),
				action_wait_for_object_destroy(obj_textbox),
				action_actor_set_autowalk("Susie", true),
				action_move_actor_nondirect("Susie",140,200,2,PREFER.HORZ),
				action_destroy_actor("Susie"),
				action_create_actor("Toby",490,240,spr_toby_sleep),
				action_move(obj_camera_focus_dot,obj_camera_focus_dot.xstart + 150,obj_camera_focus_dot.ystart,2)
				
			]
			
			
		start_cutscene(actions)
	}	
}