event_inherited();

spd = 30;

grav = 0;

solids = [];

active = false;

wake =  function() {
	active = true;
}

timer = time_source_create(time_source_game, 5, time_source_units_seconds, wake);
time_source_start(timer);