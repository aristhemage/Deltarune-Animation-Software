// Follows the object that has the last "owner" variable.
function follow_original_owner(){
	var master = find_original_owner(owner);
		// Define the needed variables once (Cant do it within !offset_set because then I would need
		// A defined offset_set :p
		if(!variable_instance_exists(id,"offset_set")){
			x_offset = 0;
			y_offset = 0;
			offset_set = false;
		}
		
		if(!offset_set){

			x_offset = x-master.x;
			y_offset = y-master.y;
			offset_set = true;
		}else{
			x = master.x + x_offset;
			y = master.y + y_offset;
		}
}