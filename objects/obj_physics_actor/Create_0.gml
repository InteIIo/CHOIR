//Velocity
vel_x = 0;
vel_y = 0;

def_grav = 3;
grav = def_grav;

term_vel = 160;

//Everything that can be collided with
solids = [obj_solid];

//For precise collisions
sub_pixel = 0.5;

on_ground = false;

function move_horizontal() {
	if place_meeting(x + vel_x, y, solids) {
		//Subpixel movement
		while !place_meeting(x + sign(vel_x)*sub_pixel, y, solids) {
			x += sign(vel_x)*sub_pixel;
		}
		vel_x = 0;
	} else {
		//Move normally if no collisions
		x += vel_x;
	}
}
function move_vertical() {
	if place_meeting(x, y + vel_y, solids) {
		//Subpixel movement
		while !place_meeting(x, y + sign(vel_y)*sub_pixel, solids) {
			y += sign(vel_y)*sub_pixel;
		}
		if vel_y > 0 {
			on_ground = true;
			vel_y = 0;
		} else {vel_y = 1;}
	} else {
		//Move normally if no collisions
		y += vel_y;
		on_ground = false;
	}
}