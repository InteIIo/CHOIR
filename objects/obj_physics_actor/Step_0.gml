vel_y += grav;
if vel_y > term_vel {vel_y = term_vel}

move_horizontal();
move_vertical();