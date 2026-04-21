// Inherit the parent event
event_inherited();

#region movement stuff
face_dir = 1;
move_dir = 0;

move_spd = 35;
walk_spd = 20;
run_spd = 40;
prev_spd = 0;
drag = 0.3;
accel = 0.3;

vault_timer = 0;
vault_input_window = 12;
vault_height =  64;
vault_boost_spd = 7;

jump_force = 6;
jump_timer = 0;
jump_time = 10;

wall_stick_timer = 0;
wall_stick_time = 30;
#endregion

hp_bar_length = 1280;
max_hp = 100;
injury = 0;
insanity = 0;
hp = max_hp - insanity;


enum player_states {
	def,
	run,
	brake,
	slide,
	
	vault,
	
	on_wall,
	wall_jump
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
	} else {jump_timer = 0;}
}