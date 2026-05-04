draw_set_halign(fa_center);

draw_text_transformed(
	display_get_gui_width()/2,
	0,
	time_source_get_time_remaining(other.timer),
	6,
	6,
	0
);