x = follow.x;
y = follow.y;

x = clamp(x, cam_width/2, room_width - cam_width/2);
y = clamp(y, cam_height/2, room_height - cam_height/2);

camera_set_view_pos(view_camera[0], x - cam_width / 2, y - cam_height / 2);
camera_set_view_size(view_camera[0], cam_width, cam_height)