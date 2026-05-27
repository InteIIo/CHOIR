function item(
	_name = "ITEM",
	_sprite = spr_missing_texture,
	_durability = 3,
	_use = function() {show_debug_message("Does nothing")}
	) constructor {
		name = _name;
		sprite = _sprite;
		durability = _durability;
		use = _use;
		static clone = function() {
			return new item(name, sprite, durability, use);
		};
};
global.items = {
	dagger : new item(
		"Surgical Dagger",
		spr_dagger,
		3,
		function() {
			with obj_player {
				jump_timer = jump_time;
				state = player_states.dagger_dash;
			}
		}
	),
	
	bandage : new item(
		"bandage",
		spr_missing_texture,
		1,
		function() {
			with obj_player {
				injury -= 10;
				if injury < 0 {injury = 0;}
			}
		}
	),
	
	grapple : new item(
		"Grappling hook",
		spr_missing_texture,
		1,
		function() {
			with obj_player {
				instance_create_depth(x, y-16, -1, obj_grapple);
			}
		}
	)
};

function inventory_add_item(_item) {
	with obj_player {
		for (var i = 0; i < array_length(inventory); i++) {
			if inventory[i] == undefined {
				inventory[i] = _item;
				break;
			}
		}
	}
}