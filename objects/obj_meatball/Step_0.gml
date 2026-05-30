// Inherit the parent event
event_inherited();

if rushing {
	var dir = point_direction(x, y, rush_target_x, rush_target_y);
	vel_x = lengthdir_x(rush_spd, dir);
	vel_y = lengthdir_y(rush_spd, dir);
	var dist_to_player = distance_to_point(rush_target_x, rush_target_y);
	if dist_to_player <= rush_spd {
		stop_rush(rush_time);
	}
	
	if do_damage && collision_line(x, y, rush_target_x, rush_target_y, obj_player, false, false){
	if obj_player.state == player_states.dagger_dash {
		stop_rush(rush_time*8);
		vel_x = 0;
		vel_y = 0;
	} else {
		obj_player.take_damage(20);
	}
	do_damage = false;
}
	
} else {
	choose_dir();
}

if rush_timer > 0 {
	rush_timer--;
} else {
	rushing = true;
}