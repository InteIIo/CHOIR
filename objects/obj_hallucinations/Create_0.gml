//The current hallucinations that are active and can be spawned
hallucination_pool = [obj_glare];

//Time between when entities can spawn
spawn_time = 15;

//The chance an entity has to spawn
spawn_chance = 50;

spawn = function() {
	if irandom(100) <= spawn_chance {
		var spawn_index = irandom(array_length(hallucination_pool)-1);
		instance_create_depth(0, 0, 0, hallucination_pool[spawn_index]);
	}
}

spawn_timer = time_source_create(time_source_game, spawn_time, time_source_units_seconds, spawn, [], -1);
time_source_start(spawn_timer);