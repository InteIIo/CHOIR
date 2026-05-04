get_controls();
if keyboard_check_pressed(vk_f5) {room_restart();}
//Update consistant values
move_dir = right - left;
hp = max_hp - injury - insanity;

switch (state) {
	case(player_states.def) : {
		sprite_index = spr_player;
		if down {sprite_index = spr_player_slide;}
		move_spd = walk_spd;
		if move_dir != 0 {face_dir = move_dir;}
		vel_x = move_dir*move_spd;
		do_push();
		
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
		        vault_timer = vault_input_window;
		        state = player_states.vault;
		    }
		}
		
		do_push();
		
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
		do_push();
		break;
	}
	
	case(player_states.slide) : {
		vel_x = face_dir*move_spd;
		if !on_ground {vel_y += grav}
		
		sprite_index = spr_player_slide;
		if (!down) {state = player_states.run;}
		
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

	case(player_states.push) : {
		sprite_index = spr_player_push;
		if place_meeting(x+face_dir, y, obj_solid) {
			face_dir = -face_dir;
			move_spd += vault_boost_spd;
			jump_timer = jump_time;
			state = player_states.wall_jump;
		}
		push_timer--;
		if push_timer <= 0 {state = player_states.run;}
	}

}

event_inherited();