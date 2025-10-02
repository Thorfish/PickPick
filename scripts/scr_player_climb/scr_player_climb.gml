function scr_player_climb(){
	var dir = point_direction(pick.x, pick.y, mouse_x, mouse_y);
	
	
	if(mouse_check_button_released(mb_left)) {
		h_speed_f -= lengthdir_x(2, dir);
		v_speed_f -= lengthdir_y(2, dir);
		
		//Note this is a safeguard. Without it, you can launch yourself into the ground and the collision check fails and places you in the next tile.
		if(is_grounded()) {
			v_speed_f = 0; 	
		}
		player_state=PlayerState.NEUTRAL;
	}
	
	set_horizontal_check();
	if(is_horizontal_tile_exist()) {
		if(h_speed_f > 0) {
			set_horizontal_when_moving_right();
		}
		else {
			set_horizontal_when_moving_left();
		}
		h_speed_f = 0;
	}
	
	set_vertical_check();
	if(is_vertical_tile_exist()) {
		if(v_speed_f > 0) {
			set_vertical_when_hitting_ground();
		}
		else {
			set_vertical_when_hitting_roof();
		}
		v_speed_f = 0;
	}
}
