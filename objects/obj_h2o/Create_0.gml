// Grid size
grid_w = room_width;
grid_h = room_height;
ca_fall_down_depth = 10;
ca_fall_diagonal_depth=5;
brush_radius = 4;

// Create surfaces
ca_surface_a = surface_create(grid_w, grid_h);
ca_surface_b = surface_create(grid_w, grid_h);
render_surface = surface_create(grid_w, grid_h);
active_surface = ca_surface_a;

//Init Surface
init_temp=DEG0;
init_state=FREE;
init_matter=AIR;
init_alpha=1;

// Clear both surfaces to transparent (air)
surface_set_target(ca_surface_a);
draw_clear_alpha(make_colour_rgb(init_temp*255, init_state*255, init_matter*255), init_alpha);
surface_reset_target();

surface_set_target(ca_surface_b);
draw_clear_alpha(make_colour_rgb(init_temp*255, init_state*255, init_matter*255), init_alpha);
surface_reset_target();

surface_set_target(render_surface);
draw_clear_alpha(c_black, 0);
surface_reset_target();