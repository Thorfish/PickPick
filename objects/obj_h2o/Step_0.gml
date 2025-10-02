if(surface_exists(ca_surface_a) && surface_exists(ca_surface_b) && surface_exists(render_surface)) {
	add();
	ca_step(sh_h2o_init)
	ca_compute(pressure_surface, sh_h2o_pressure);
	ca_step_depth(sh_h2o_fall_down, ca_fall_down_depth);
	ca_step_depth(sh_h2o_fall_diagonal, ca_fall_diagonal_depth);
	ca_step(sh_h2o_ice);
	ca_compute(render_surface, sh_h2o_render);
}

function ca_step_depth(shader, it_depth) {
	for(var i=0; i<it_depth; i++) {
		ca_step(shader);
	}
}

function ca_step(shader) {

	var source = active_surface;
	var destination = (active_surface == ca_surface_a) ? ca_surface_b : ca_surface_a;
	
	// Set shader
	shader_set(shader);

	// bind texture to stage 0
	var tex = surface_get_texture(source);
	texture_set_stage(0, tex);

	// Set texel uniform
	var u = shader_get_uniform(shader, "u_texel");
	shader_set_uniform_f(u, 1.0/grid_w, 1.0/grid_h);

	// Set shader constant to read from stage 0
	var s = shader_get_uniform(shader, "u_texture");
	shader_set_uniform_i(s, 0);

	// Draw source through shader into target
	surface_set_target(destination);
	draw_clear_alpha(c_black, 0);
	draw_surface(source, 0, 0);
	
	surface_reset_target();
	shader_reset();
	
	active_surface = destination;
}

function ca_compute(surface, shader) {
	var source = active_surface;
	var destination = surface;
	
	// Set shader
	shader_set(shader);

	// bind texture to stage 0
	var tex = surface_get_texture(source);
	texture_set_stage(0, tex);

	// Set texel uniform
	var u = shader_get_uniform(shader, "u_texel");
	shader_set_uniform_f(u, 1.0/grid_w, 1.0/grid_h);

	// Set shader constant to read from stage 0
	var s = shader_get_uniform(shader, "u_texture");
	shader_set_uniform_i(s, 0);

	// Draw source through shader into target
	surface_set_target(destination);
	draw_clear_alpha(c_black, 0);
	draw_surface(source, 0, 0);
	
	surface_reset_target();
	shader_reset();
}

function draw_set_rgba(r, g, b, a) {
	draw_set_color(make_colour_rgb(r*255, g*255, b*255));
	draw_set_alpha(a);
}

function set_brush(temperature, state, matter, alpha) {
	self.temperature=temperature;
	self.state=state;
	self.matter=matter;
	self.alpha=alpha;
}

function add() {
	if (mouse_check_button(mb_left)) {
	    var mx = mouse_x;
	    var my = mouse_y;
    
	    surface_set_target(active_surface);
	    draw_set_rgba(temperature, state, matter, alpha);
	    draw_circle(mx, my, brush_radius, false);
	    surface_reset_target();
		draw_set_alpha(1);
	}
}