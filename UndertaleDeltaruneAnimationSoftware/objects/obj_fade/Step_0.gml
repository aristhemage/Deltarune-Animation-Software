if(fade_in){
	fade_out = false;	
	if(alpha > 0){
		alpha -= fade_spd;		
	}else{
		fade_in = false;	
	}
}

if(fade_out){
	fade_in = false;	
	if(alpha < 1){
		alpha += fade_spd;
	}else{
		fade_out = false;	
	}
}