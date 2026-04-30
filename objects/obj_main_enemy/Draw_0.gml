if active {draw_self();}
else {
	with obj_camera {
		draw_set_halign(fa_center);
		draw_text_transformed(x, (y-cam_height/2) + 128, time_source_get_time_remaining(other.timer), 8, 8, 0);
	}
}