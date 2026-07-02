function cutscene(){
	with(obj_cutscene_master){
		var actions = [
				action_wait_time(1),
				action_move_actor_nondirect("Susie",obj_checkpoint_a.x,obj_checkpoint_a.y,2,PREFER.VERT),
				action_display_text(["Woah I cant beleive that over there is the true identiy of the roaring knight!", "So glad I can see this, and not stuck in some game with a locked camera... That would be totally lame. Like... imagine!", "Anyway ima going to play uhh... Minecraft now...\n   Bye!"],[snd_text_susie,snd_text_susie,snd_text_susie],1,120,true,spr_face_susie,[8,52,21],2,true,"Susie",[spr_susie_walk_right,spr_susie_laugh,spr_susie_walk_right],[0,1,0]),
				action_wait_for_object_destroy(obj_textbox),
				action_move_actor_nondirect("Susie",140,200,2,PREFER.HORZ),
				action_destroy_actor("Susie")
				
			]
			
			
		start_cutscene(actions)
	}	
}