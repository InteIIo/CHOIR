// Inherit the parent event
event_inherited();

if rush_timer > 0 {
	rush_timer--;
} else {
	do_damage = true;
	rush_target_x = obj_player.x + obj_player.vel_x*obj_player.vel_x;
	rush_target_y = obj_player.y - obj_player.sprite_height/2;
	var dir = point_direction(x, y, rush_target_x, rush_target_y);
	vel_x = lengthdir_x(rush_spd, dir);
	vel_y = lengthdir_y(rush_spd, dir);
	rush_timer = rush_time;
}