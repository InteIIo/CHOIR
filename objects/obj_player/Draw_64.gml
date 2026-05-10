//Draw health
var seg_x = 16;
draw_line_width_colour(seg_x, 16, seg_x+(hp/max_hp)*hp_bar_length, 16, 64, c_green, c_green);
seg_x += (hp/max_hp)*hp_bar_length;
draw_line_width_colour(seg_x, 16, seg_x+(injury/max_hp)*hp_bar_length, 16, 64, c_red, c_red);
seg_x += (injury/max_hp)*hp_bar_length;
draw_line_width_colour(seg_x, 16, seg_x+(insanity/max_hp)*hp_bar_length, 16, 64, c_purple, c_purple);

if keyboard_check_pressed(vk_delete) {injury+= 10}
if keyboard_check_pressed(vk_alt) {insanity+= 5}

if state == player_states.in_inventory {
	draw_sprite(spr_inventory_background, 0, 0, 0);
	
}

if inventory[quickslot_index] != undefined {
	draw_sprite(inventory[quickslot_index].sprite, 0, 32, 128);
}