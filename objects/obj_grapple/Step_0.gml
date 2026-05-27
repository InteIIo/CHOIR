// Inherit the parent event
event_inherited();

if place_meeting(x, y-1, solids) {
	with obj_player {
		vel_y -= 100;
		move_spd += sign(other.x - x)*30
		instance_destroy(other);
	}
}