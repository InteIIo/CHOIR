//Draw health
var seg_x = 16;
draw_line_width_colour(seg_x, 16, seg_x+(hp/max_hp)*hp_bar_length, 16, 64, c_green, c_green);
seg_x += (hp/max_hp)*hp_bar_length;
draw_line_width_colour(seg_x, 16, seg_x+(injury/max_hp)*hp_bar_length, 16, 64, c_red, c_red);
seg_x += (injury/max_hp)*hp_bar_length;
draw_line_width_colour(seg_x, 16, seg_x+(insanity/max_hp)*hp_bar_length, 16, 64, c_purple, c_purple);

if keyboard_check_pressed(vk_delete) {injury+= 10}
if keyboard_check_pressed(vk_alt) {insanity+= 5}

draw_text(32, 64, money);


var equipped = inventory[inventory_index];
if equipped != undefined {
	draw_sprite(equipped.sprite, 0, 32, 128);
	draw_line_width(32, 128+12, (equipped.durability/3)*256, 128+12, 12);
}
