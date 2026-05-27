var keys = struct_get_names(global.items);
item_id = struct_get(global.items, keys[irandom(array_length(keys)-1)]);
item_id = item_id.clone();