//Set Center (Pivot) Point
center_x = climber.x+center_x_offset;
center_y = climber.y+center_y_offset;

//Determine direction and distance to mouse
dir = point_direction(center_x, center_y, mouse_x, mouse_y);
dist = clamp(point_distance(center_x, center_y, mouse_x, mouse_y), 0, hold_radius);

//Set x and y
x = center_x+lengthdir_x(dist, dir);
y = center_y+lengthdir_y(dist, dir);

//Animation
if(climber.image_xscale == 1) sprite_index = spr_pick;	
else sprite_index = spr_pick_rev;
face = floor(dir*image_xscale/30);
image_index = face;

target.x=x+lengthdir_x(hit_radius, dir);
target.y=y+lengthdir_y(hit_radius, dir);