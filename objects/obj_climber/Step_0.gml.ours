//Input
var h_axis = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var jump = keyboard_check_pressed(vk_space);

#region Movement
//Horizontal Movement
h_speed = h_axis * run_speed;
set_horizontal_check();
if(tilemap_get_at_pixel(tilemap, bbox_h+h_speed, bbox_top) != 0 || tilemap_get_at_pixel(tilemap, bbox_h+h_speed, bbox_bottom-1)!= 0) {
	if(h_speed > 0) {
		set_horizontal_when_moving_right();
	}
	else {
		set_horizontal_when_moving_left();
	}
	h_speed = 0;
}
x+=h_speed;

//Vertical Movement

if(is_grounded()) {
	if(jump) {
		v_speed = -jump_speed;
	}
} else {
	v_speed += fall_speed;
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

y+=v_speed;

#endregion
#region Animation
if(h_speed != 0) {
	sprite_index = spr_climber_run;
	if(h_speed > 0) {
		image_xscale=1;
	} else {
		image_xscale=-1;
	}
} else {
	sprite_index=spr_climber_idle;	
}

function is_grounded() {
	return (tilemap_get_at_pixel(tilemap, bbox_left, y) != 0 || tilemap_get_at_pixel(tilemap, bbox_right, y)!= 0);
}

/// @description Sets if it should check collision the left or right
function set_horizontal_check() {
	if(h_speed > 0) bbox_h = bbox_right; else bbox_h = bbox_left;
}

function is_horizontal_tile_exist() {
	return tilemap_get_at_pixel(tilemap, bbox_h+h_speed, bbox_top) != 0 || tilemap_get_at_pixel(tilemap, bbox_h+h_speed, bbox_bottom-1)!= 0;
}

function set_horizontal_when_moving_right() {
	x = x-(x % 16) + 15 - (bbox_right-x);
}

function set_horizontal_when_moving_left() {
	x=x-(x % 16) - (bbox_left - x);
}

/// @description Sets if it should check collision up or down
function set_vertical_check() {
	if(v_speed > 0) bbox_v = bbox_bottom; else bbox_v = bbox_top;
}

function is_vertical_tile_exist() {
	return tilemap_get_at_pixel(tilemap, bbox_left, bbox_v+v_speed) != 0 || tilemap_get_at_pixel(tilemap, bbox_right, bbox_v+v_speed)!= 0;
}

function set_vertical_when_hitting_ground() {
	y = y-(y % TILE_PIXEL_SIZE) + TILE_PIXEL_SIZE - (bbox_bottom-y);
}

function set_vertical_when_hitting_roof() {
	y = y-(y % TILE_PIXEL_SIZE) - TILE_PIXEL_SIZE - (bbox_top - y);
}