if(owner != -1){
	if(!instance_exists(owner)){
		instance_destroy();	
	}else{
		follow_original_owner()	
	}
}

