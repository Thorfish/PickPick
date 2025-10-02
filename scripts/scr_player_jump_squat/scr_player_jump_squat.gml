function scr_player_jump_squat(){
	h_speed/=jump_slow_factor;
	sprite_index = spr_climber_jump;
	image_index = 0;
	
	//Update Position
	x+=h_speed;
	y+=v_speed;
}