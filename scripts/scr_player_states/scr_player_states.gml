#region //Normal player states

function enter_normal(){
	move_spd = 2
	audio_stop_sound(snd_running)
}
function player_state_normal(){
	xspd = move_dir*move_spd
	if move_dir != 0 {face_dir = move_dir}
		
	if action && !down && !place_meeting(x+xspd,y,global.ground) && ammo > 0{move_state = "running"; shoot(-face_dir, 0)}
	if down {
		if grounded {reload()}
		else if action{move_state = "diving"; shoot(0, -1)}
	}
}

function enter_running(){
	if move_spd < 5{move_spd = 5}
	if !audio_is_playing(snd_running) {audio_play_sound(snd_running, 1, true)}
}
function player_state_running(){
	sprite_index = spr_player_run
	xspd = face_dir *move_spd
		
	if move_dir != face_dir && grounded{move_state = "breaking"}
	if action && ammo > 0{
		if down {
			move_state = "diving";
			shoot(0, 90)
		} else if  move_dir == -face_dir {
			move_state = "normal"; shoot(face_dir, 0);
			} else {move_spd += 1; shoot(-face_dir, 0)}
		}
		
	if down_pressed{move_state = "sliding"}
}

function player_state_breaking(){
	xspd = face_dir * move_spd
	move_spd -= 0.2
	if move_spd == 0 {move_state = "normal"}
	if move_dir == -face_dir && action {move_state = "normal"; shoot(face_dir, 0)}
	audio_stop_sound(snd_running)
}
function player_state_sliding(){
	xspd = face_dir *move_spd
	if !grounded{yspd += grav/2}
	if !down && !place_meeting(x+xspd,y-4, global.ground){move_state = "running"}
	
	if action && ammo > 0  && !grounded{move_state = "diving"; shoot(0, -1)}
}
	
function enter_diving(){
	yspd = -2
}
function player_state_diving(){
	if action && ammo > 0 {move_state = "running"; shoot(-face_dir, 0)}
	if move_dir != 0 {face_dir = move_dir}
	yspd += grav;
	if grounded {yspd = -11; if move_spd >= 5 {move_state = "running"} else{move_state = "normal"}}
}

function enter_bouncing(){
	wall_bounce_timer = 8
	reload();
}
function player_state_bouncing(){
	xspd = -face_dir*2
	face_dir = face_dir
	yspd += -0.5
	yspd = clamp(yspd, -8, -2)
	wall_bounce_timer--
	if wall_bounce_timer <= 0 {move_state = "normal"}
}

#endregion

#region //Other player states
function player_state_grinding(){
	move_dir = face_dir
	xspd = face_dir*4
	if !place_meeting(x,y+1, obj_grind_rail){move_state = "running"}
}
#endregion