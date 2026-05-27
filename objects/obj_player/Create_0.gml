// Inherit the parent event
event_inherited();

#region movement stuff
face_dir = 1;
move_dir = 0;

move_spd = 35;
walk_spd = 20;
run_spd = 35;
prev_spd = 0;
drag = 0.8;
accel = 0.4;

vault_timer = 0;
vault_input_window = 12;
vault_height = 96;
vault_boost_spd = 25;

jump_force = 7;
jump_timer = 0;
jump_time = 10;
jump_buffer_timer = 0;
jump_buffer_time = 60;

wallrun_timer = 0;
wallrun_time = 15;

#endregion
#region Health Stuff
hp_bar_length = display_get_gui_width()/4;
max_hp = 100;
injury = 0;
insanity = 0;
hp = max_hp - injury - insanity;
#endregion


money = 0;

inventory = array_create(2, undefined);
inventory[0] = global.items.dagger.clone();

inventory_index = 0;

enum player_states {
	def,
	run,
	brake,
	slide,
	
	vault,
	
	wall_jump,
	wall_run,
	wall_run_background,
	
	//Item states
	dagger_dash
}
state = player_states.def;

function do_jump() {
	if jump_pressed && on_ground {
		jump_timer = jump_time
		vel_y = -2;
		}
	if jump_timer > 0 && jump{
		jump_timer--;
		vel_y -= jump_force;
	if keyboard_check_released(vk_space) {vel_y = -1;}
	} else {jump_timer = 0;}
}