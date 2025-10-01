dir = point_direction(climber.x, climber.y, mouse_x, mouse_y);
x = climber.x+center_x_offset+lengthdir_x(hold_radius, dir);
y = climber.y+center_y_offset+lengthdir_y(hold_radius, dir);

image_xscale=climber.image_xscale;

face = floor(dir/30);
image_index = face;