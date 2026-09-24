function debug_move_script(){
	if (keyboard_check(ord("W")) || keyboard_check(vk_up))    y -= 4;
	if (keyboard_check(ord("S")) || keyboard_check(vk_down))  y += 4;
	if (keyboard_check(ord("A")) || keyboard_check(vk_left))  x -= 4;
	if (keyboard_check(ord("D")) || keyboard_check(vk_right)) x += 4;
	
	show_debug_message("X: " + string(x) + "| Y: " + string(y))
}