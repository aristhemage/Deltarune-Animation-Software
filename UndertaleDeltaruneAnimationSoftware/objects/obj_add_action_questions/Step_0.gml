if(instance_exists(owner)){
	x = owner.x + 128;
	y = owner.y + 128;
}else{
	instance_destroy();	
}

// Cant be and because of some GML BS.
if(instance_exists(owner)){
	if(instance_exists(owner.owner)){	
		owner.owner.answers_arr = answers_arr;
	}
}