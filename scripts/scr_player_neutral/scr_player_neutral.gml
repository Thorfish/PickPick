function scr_player_neutral(){
	var h_axis = keyboard_check(ord("D")) - keyboard_check(ord("A"));
	var jump = keyboard_check_pressed(vk_space);
	var grounded = is_grounded();
	#region Basic Movement
	//Horizontal Movement
	var walk_acc = h_axis * run_acc;
	var net_acc;
	switch(sign(h_speed * walk_acc)) {
		//Acceleration in opposite to current direction
		case -1: 
			net_acc = walk_acc*opposite_move_factor;
			break;
		//Either stopped walking or moving from stationary
		case 0:
			//Apply friction
			if(walk_acc == 0) {
				//Just stopped walking
				if(grounded) {
					//Ground Friction
					net_acc = -1 * sign(h_speed) * min(ground_friction, abs(h_speed));
				} else {
					//Air friction	
					net_acc = -1 * sign(h_speed) * min(air_friction, abs(h_speed));
				}
			} else {
				//Moving from stationary
				net_acc = walk_acc*stationary_move_factor;
			}
	
			break;
		//Accelerating in the direction you are walking.
		case 1:
			net_acc = walk_acc*further_move_factor;
			break;
	}
	
	h_speed = clamp(h_speed + net_acc, -h_max, h_max);
	set_horizontal_check();
	if(is_horizontal_tile_exist()) {
		if(h_speed > 0) {
			set_horizontal_when_moving_right();
		}
		else {
			set_horizontal_when_moving_left();
		}
		h_speed = 0;
	}

	//Vertical Movement
	if(grounded) {
		if(jump) {
			player_state = PlayerState.JUMP_SQUAT;
			alarm[0] = PLAYER_JUMP_SQUAT;
		}
	} else {
		v_speed += fall_acc;
	}

	set_vertical_check();
	if(is_vertical_tile_exist()) {
		if(v_speed > 0) {
			set_vertical_when_hitting_ground();
		}
		else {
			set_vertical_when_hitting_roof();
		}
		v_speed = 0;
	}
	#endregion
	#region Swing
	if(mouse_check_button(mb_left)) {
		pick.make_particles=true;
		pick.alarm[0]=5;
		if(target.check_tile_collisions()) {
			player_state = PlayerState.CLIMB;
			h_speed = 0;
			v_speed = 0;
		}
	}
	#endregion
	if(h_speed > 0) {
		image_xscale=1;
	} else if(h_speed < 0) {
		image_xscale=-1;
	}

	if (!grounded) {
		sprite_index = spr_climber_jump;
		image_index = 1;
	} else if (h_speed != 0) {
		sprite_index = spr_climber_run;
	} else if (h_speed = 0) {
		sprite_index = spr_climber_idle;
	}
	
}


#region Functions
function is_grounded() {
	return (tilemap_get_at_pixel(tm_collision, bbox_left, y) != 0 || tilemap_get_at_pixel(tm_collision, bbox_right, y)!= 0);
}

/// @description Sets if it should check collision the left or right
function set_horizontal_check() {
	if(h_speed > 0) bbox_h = bbox_right; else bbox_h = bbox_left;
}

function is_horizontal_tile_exist() {
	return tilemap_get_at_pixel(tm_collision, bbox_h+h_speed, bbox_top) != 0 || tilemap_get_at_pixel(tm_collision, bbox_h+h_speed, bbox_bottom-1)!= 0;
}

function set_horizontal_when_moving_right() {
	x = x-(x % TILE_PIXEL_SIZE) + 15 - (bbox_right-x);
}

function set_horizontal_when_moving_left() {
	x=x-(x % TILE_PIXEL_SIZE) - (bbox_left - x);
}

/// @description Sets if it should check collision up or down
function set_vertical_check() {
	if(v_speed > 0) bbox_v = bbox_bottom; else bbox_v = bbox_top;
}

function is_vertical_tile_exist() {
	return tilemap_get_at_pixel(tm_collision, bbox_left, bbox_v+v_speed) != 0 || tilemap_get_at_pixel(tm_collision, bbox_right, bbox_v+v_speed)!= 0;
}

function set_vertical_when_hitting_ground() {
	y = y-(y % TILE_PIXEL_SIZE) + TILE_PIXEL_SIZE - (bbox_bottom-y);
}

function set_vertical_when_hitting_roof() {
	y = y-(y % TILE_PIXEL_SIZE) - TILE_PIXEL_SIZE - (bbox_top - y);
}

function do_jump() {
	v_speed = -jump_impulse;
}
#endregion