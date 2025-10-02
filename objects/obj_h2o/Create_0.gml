// Grid size
grid_w = room_width;
grid_h = room_height;
ca_fall_down_depth = 10;
ca_fall_diagonal_depth=10;
brush_radius = 2;

//Brush Settings
temperature = DEG0;
state=FREE;
matter=AIR;
alpha=0.0;

// Create surfaces
init_temp=DEG0;
init_state=FREE;
init_matter=AIR;
init_alpha=1;
col = make_colour_rgb(init_temp*255, init_state*255, init_matter*255);

ca_surface_a = initSurface(grid_w, grid_h, col, init_alpha);
ca_surface_b = initSurface(grid_w, grid_h, col, init_alpha);
pressure_surface = initSurface(grid_w, grid_h, c_black, init_alpha);
render_surface = initSurface(grid_w, grid_h, c_black, 0.0);

active_surface = ca_surface_a;


function initSurface(width, height, color, alpha) {
	surface = surface_create(width, height);
	surface_set_target(surface);
	draw_clear_alpha(color, alpha);
	surface_reset_target();
	return surface;
}