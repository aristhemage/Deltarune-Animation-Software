if(controllable){
	if (keyboard_check(ord("W")) || keyboard_check(vk_up))    if(y-4 > 0) y -= 4;
	if (keyboard_check(ord("S")) || keyboard_check(vk_down))  if(y+4 < room_height)  y += 4;
	if (keyboard_check(ord("A")) || keyboard_check(vk_left))  if(x-4 > 0) x -= 4;
	if (keyboard_check(ord("D")) || keyboard_check(vk_right)) if(x+4 < room_width) x += 4;
}