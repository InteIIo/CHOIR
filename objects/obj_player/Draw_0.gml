draw_sprite_ext(sprite_index, image_index, x, y, face_dir, image_yscale, image_angle, c_white, 1);

if keyboard_check_pressed(vk_f11) {window_set_fullscreen(!window_get_fullscreen());}


//Draw health
var seg_x = 16;
draw_line_width_colour(seg_x, 16, seg_x+(hp/max_hp)*hp_bar_length, 16, 128, c_green, c_green);
seg_x += (hp/max_hp)*hp_bar_length;
draw_line_width_colour(seg_x, 16, seg_x+(injury/max_hp)*hp_bar_length, 16, 128, c_red, c_red);
seg_x += (injury/max_hp)*hp_bar_length;
draw_line_width_colour(seg_x, 16, seg_x+(insanity/max_hp)*hp_bar_length, 16, 128, c_purple, c_purple);

if keyboard_check_pressed(vk_delete) {injury+= 10}
if keyboard_check_pressed(vk_alt) {insanity+= 5}