//Input
var h_axis = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var jump = keyboard_check_pressed(vk_space);

#region Movement
//Horizontal Movement
h_speed = h_axis * run_speed;
if(h_speed > 0) bbox_h = bbox_right; else bbox_h = bbox_left;

if(tilemap_get_at_pixel(tilemap, bbox_h+h_speed, bbox_top) != 0 || tilemap_get_at_pixel(tilemap, bbox_h+h_speed, bbox_bottom-1)!= 0) {
	if(h_speed > 0) x = x-(x % 16) + 15 - (bbox_right-x);
	else x=x-(x % 16) - (bbox_left - x);
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

if(v_speed > 0) bbox_v = bbox_bottom; else bbox_v = bbox_top;
if(tilemap_get_at_pixel(tilemap, bbox_left, bbox_v+v_speed) != 0 || tilemap_get_at_pixel(tilemap, bbox_right, bbox_v+v_speed)!= 0) {
	if(v_speed > 0) y = y-(y % 16) + 16 - (bbox_bottom-y);
	else y=y-(y % 16) - 16 - (bbox_top - y);
	v_speed = 0;
}

y+=v_speed;


//Pick Update
pick.x = x+pick_xoff;
pick.y = y+pick_yoff;
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
	return (tilemap_get_at_pixel(tilemap, bbox_left, y) != 0) or (tilemap_get_at_pixel(tilemap, bbox_right, y)!= 0);
}

//function check_vertical_pixel