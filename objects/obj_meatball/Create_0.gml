event_inherited();
grav = 0;

rush_spd = 500;
rush_timer = 60;
rush_time = 60;
rush_target_x = obj_player.x;
rush_target_y = obj_player.y;
rushing = false;

chose_direction = false;

damage = 10;

solids = [];

do_damage = false;

function choose_dir() {
	if !chose_direction {
		do_damage = true;
		rush_target_x = obj_player.x + obj_player.vel_x*8;
		rush_target_y = obj_player.y - obj_player.sprite_height/2;
		chose_direction = true;
	}
}

function stop_rush(_time) {
		x = rush_target_x;
		y = rush_target_y;
		vel_x = 0;
		vel_y = 0;
		chose_direction = false;
		do_damage = false;
		rushing = false;
		rush_timer = _time;
}