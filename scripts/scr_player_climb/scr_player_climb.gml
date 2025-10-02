function scr_player_climb(){
	var dir = point_direction(pick.x, pick.y, mouse_x, mouse_y);
	
	if(mouse_check_button_released(mb_left)) {
		h_speed_f -= lengthdir_x(climb_max, dir);
		v_speed_f -= lengthdir_y(climb_max, dir);
		
		//Note this is a safeguard. Without it, you can launch yourself into the ground and the collision check fails and places you in the next tile.
		if(is_grounded()) {
			v_speed_f = 0; 	
		}
		player_state=PlayerState.NEUTRAL;
	}
}
