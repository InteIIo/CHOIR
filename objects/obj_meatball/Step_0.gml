// Inherit the parent event
event_inherited();

if collision_rectangle(x - rad, y-rad, x+rad, y+rad, obj_player, false, false) && !has_rushed{
	var dir = point_direction(x, y, obj_player.x, obj_player.y - obj_player.sprite_height/2);
	vel_x = lengthdir_x(rush_spd, dir);
	vel_y = lengthdir_y(rush_spd, dir);
	
	has_rushed = true;
}

if place_meeting(x+vel_x, y+vel_y, solids) {
	instance_destroy(self);
}

if place_meeting(x+vel_x, y+vel_y, obj_player) {
	obj_player.injury += damage;
	instance_destroy(self);
}