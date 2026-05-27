get_controls();
if keyboard_check_pressed(vk_f5) {game_restart();}
//Update consistant values
move_dir = right - left;
hp = max_hp - injury - insanity;

//State machine (should probably clean up later)
switch (state) {
	case(player_states.def) : {
		sprite_index = spr_player;
		if down {sprite_index = spr_player_slide;}
		move_spd = walk_spd;
		if move_dir != 0 {face_dir = move_dir;}
		vel_x = move_dir*move_spd;
		
		do_jump();
		if (run && move_dir != 0) {state = player_states.run;}
		break;
	}
	
	case(player_states.run) : {
		sprite_index = spr_player;
		vel_x = move_dir*move_spd;
		do_jump();
		if (move_dir != face_dir || !run) {state = player_states.brake;}
		if down {state = player_states.slide}
		
		if place_meeting(x+vel_x, y, solids) {
		    if !place_meeting(x+vel_x, y-vault_height, solids) {
		        y -= vault_height;
				jump_timer = 0;
		        vault_timer = vault_input_window;
		        state = player_states.vault;
		    }
			else {
				wallrun_timer = wallrun_time;
				state = player_states.wall_run;
			}
		}
		
		if move_spd > run_spd {move_spd -= drag}
		else {move_spd += accel;}
		break;
	}
	
	case(player_states.vault) : {
		vault_timer--;
		if jump_pressed {
			move_spd+=vault_boost_spd;
			vel_y = -jump_force*4;
			state = player_states.run;
		}
		vel_x = move_dir*move_spd;
		if (move_dir != face_dir || !run) {state = player_states.def;}
		if vault_timer <= 0 {state = player_states.run}
		break;
	}
	
	case(player_states.brake) : {
		sprite_index = spr_player;
		vel_x = move_spd*face_dir;
		move_spd -= 3;
		if (abs(vel_x) <= 3) {state = player_states.def;}
		break;
	}
	
	case(player_states.slide) : {
		vel_x = face_dir*move_spd;
		if !on_ground {vel_y += grav*2}
		
		sprite_index = spr_player_slide;
		if (!down && !place_meeting(x, y-sprite_height, solids)) {state = player_states.run;}
		
		if move_spd > run_spd {move_spd -= drag;}
		else {move_spd = run_spd;}
		break;
	}

	case(player_states.wall_jump) : {
		jump_timer--;
		if jump_timer <= 0 || on_ground {state = player_states.run;}
		
		vel_x = face_dir*move_spd;
		if move_spd > run_spd {move_spd -= drag}
		else {move_spd += accel;}
		break;
	}

	case(player_states.wall_run) : {
		vel_y = -move_spd;
		if !place_meeting(x+face_dir, y, solids) || move_dir != face_dir {
			state = player_states.def;
			
			if !place_meeting(x+face_dir, y-vault_height, solids) {
		        y -= vault_height;
		        vault_timer = vault_input_window;
		        state = player_states.vault;
		    }
			
		}
		
		wallrun_timer--;
		if jump_pressed || wallrun_timer <= 0{
			face_dir = -face_dir;
			move_spd += vault_boost_spd;
			jump_timer = jump_time;
			state = player_states.wall_jump;
		}
		
		break;
	}
	
	case(player_states.wall_run_background) : {
		vel_x = face_dir*move_spd;
		vel_y -= grav;
		
		if !place_meeting(x, y, obj_background_wall) || !jump {
			vel_y -= jump_force*4;
			move_spd += vault_boost_spd;
			jump_timer = jump_time;
			state = player_states.wall_jump;
		}
		break;
	}
	
	case(player_states.dagger_dash) : {
		vel_y = -grav;
		vel_x = move_spd*2*face_dir;
		jump_timer--;
		if jump_timer <= 0 {state = player_states.run;}
	}
}

if place_meeting(x, y, obj_background_wall) && jump && x > instance_nearest(x, y, obj_background_wall).x {
	vel_y = 0;
	state = player_states.wall_run_background;
}


var current_item = inventory[inventory_index];
if swap_quickslot {inventory_index ^= 1}
if use_item {
	if current_item != undefined {
		current_item.use();
		current_item.durability--;
		if current_item.durability <= 0 {
			inventory[inventory_index] = undefined;
			money += 30;
		}
	}
}


event_inherited();