if active {
	var dir = point_direction(x, y, obj_player.x, obj_player.y - obj_player.sprite_height/2);
	vel_x = lengthdir_x(spd, dir);
	vel_y = lengthdir_y(spd, dir);

	spd += 0.05;

	if place_meeting(x, y, obj_player) {
		scr_player_death();
	}

	event_inherited();
}