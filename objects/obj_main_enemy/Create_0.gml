event_inherited();

spd = 30;

grav = 0;

solids = [];

active = false;

function wake() {
	active = true;
}

timer = time_source_create(time_source_game, 150, time_source_units_seconds, wake);
time_source_start(timer);