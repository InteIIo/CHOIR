function get_controls(){
	right = keyboard_check(vk_right);
	left = keyboard_check(vk_left);
	down = keyboard_check(vk_down);
	up = keyboard_check(vk_up);
	
	right_pressed = keyboard_check_pressed(vk_right);
	left_pressed = keyboard_check_pressed(vk_left);
	down_pressed = keyboard_check_pressed(vk_down);
	up_pressed = keyboard_check_pressed(vk_up);
	
	jump = keyboard_check(vk_space);
	jump_pressed = keyboard_check_pressed(vk_space);
	
	run = keyboard_check(vk_shift);
	run_pressed = keyboard_check_pressed(vk_shift);
	
	open_inventory = keyboard_check(ord("Z"));
	swap_quickslot = keyboard_check_pressed(ord("X"));
	use_item = keyboard_check_pressed(ord("C"));
}