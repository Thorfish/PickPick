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


//Set Target Position
target.x=x+lengthdir_x(hit_radius, dir);
target.y=y+lengthdir_y(hit_radius, dir);


//Swing Particle Effect
part_x=x+lengthdir_x(part_radius, dir);
part_y=y+lengthdir_y(part_radius, dir);

if(make_particles) {
	var steps = max(1, ceil(point_distance(prev_part_x, prev_part_y, part_x, part_y) * interpolation_degree)); 
	for (var i = 0; i < steps; i++) {
	    var tx = lerp(prev_part_x, part_x, i / steps);
	    var ty = lerp(prev_part_y, part_y, i / steps);
	    part_particles_create(ps, tx, ty, pt_trail, part_count);
	}
}

prev_part_x = part_x;
prev_part_y = part_y;