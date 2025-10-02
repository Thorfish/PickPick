//Init Runtime Variables
image_speed=0;
dir = 0;
dist = 0;
center_x = 0;
center_y = 0;
climber = noone;
face = 0;

//Pick Parameters
hold_radius = PICK_RADIUS;
center_x_offset = PICK_XOFF;
center_y_offset = PICK_YOFF;
hit_radius = HIT_RADIUS;

//Create Target Helper Object
target = instance_create_layer(x, y, "Player", obj_target);

#region Particle System
//Particle System for Trail
make_particles = false;

part_radius = PART_RADIUS;
size_min = 0.1;
size_max = 1;
size_inc = -0.05;
size_wig = 0;
part_count = 2;
life_min = 5;
life_max = 20;
alpha_start = 1;
alpha_end = 0;
x_scale = 1;
y_scale = 1;
interpolation_degree = 2;

part_x=x+lengthdir_x(part_radius, dir)
part_y=y+lengthdir_y(part_radius, dir);
prev_part_x = part_x;
prev_part_y = part_y;

ps = part_system_create();
part_system_depth(ps, -100);

pt_trail = part_type_create();
part_type_sprite(pt_trail, spr_pixel, false, false, false);
part_type_size(pt_trail, size_min, size_max, size_inc, size_wig);
part_type_alpha2(pt_trail, alpha_start, alpha_end);
part_type_life(pt_trail, life_min, life_max);
part_type_scale(pt_trail, x_scale, y_scale)
#endregion