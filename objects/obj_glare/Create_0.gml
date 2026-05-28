x = irandom(display_get_gui_width() - sprite_width);
y = irandom(display_get_gui_height() - sprite_height);

wake = function() {
	if obj_player.vel_x > 0 || obj_player.vel_y > 0 {
		scr_player_death();
	}
	instance_destroy();
}

call_later(3, time_source_units_seconds, wake, false);