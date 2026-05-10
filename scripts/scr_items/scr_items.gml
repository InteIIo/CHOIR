function item(
	_name = "ITEM",
	_desc = "TEST ITEM. IF YOU SEE THIS, I MESSED UP",
	_sprite = spr_missing_texture,
	_use = function() {show_debug_message("TEST ITEM")}
	) constructor {
		name = _name;
		desc = _desc;
		sprite = _sprite;
		use = _use;
};


global.items = {
	dagger : new item(
		"Surgical Dagger",
		"A precise dagger used in surgeries. Dash forward and kill smaller enemies",
		spr_dagger,
		function() {
			with obj_player {
				jump_timer = jump_time;
				state = player_states.dagger_dash;
			}
		}
	)
}