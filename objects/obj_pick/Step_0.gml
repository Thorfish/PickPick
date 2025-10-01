center_x = climber.x+center_x_offset;
center_y = climber.y+center_y_offset;

dir = point_direction(center_x, center_y, mouse_x, mouse_y);
x = center_x+lengthdir_x(hold_radius, dir);
y = center_y+lengthdir_y(hold_radius, dir);

if(climber.image_xscale == 1) {
	sprite_index = spr_pick;	
} else {
	sprite_index = spr_pick_rev;	
}

face = floor(dir*image_xscale/30);
image_index = face;