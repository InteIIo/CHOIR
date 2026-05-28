if do_damage {
	if other.state == player_states.dagger_dash {
		rush_timer = rush_time*10;
		vel_x = 0;
		vel_y = 0;
	} else {
		obj_player.take_damage(20);
	}
	do_damage = false;
}