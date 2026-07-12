function cutscene(){
	with(obj_cutscene_master){
		var actions = [
				action_wait_time(0.25),
				action_camera_follow_actor("Susie"),
				action_actor_manual_override("Susie",true),
				action_create_actor("ral",99,99,spr_ralsei_walk_down,spr_ralsei_walk_down,spr_ralsei_walk_right,spr_ralsei_walk_up,spr_ralsei_walk_left,true),
				action_actor_follow_actor("ral","Susie")
				
				
				
			]
			
			
		start_cutscene(actions)
	}	
} 