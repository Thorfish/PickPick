//Initialise Properties
run_acc = PLAYER_RUN_ACC;
jump_impulse = PLAYER_JUMP_IMPULSE;
fall_acc = PLAYER_FALL_ACC;
h_speed = 0;
h_max=8;
v_speed = 0;

opposite_move_factor = 4;
stationary_move_factor = 1.2;
further_move_factor = 0.5;

ground_friction = 0.2;
air_friction = 0.05;


jump_slow_factor = 1;

bbox_h=bbox_right;
bbox_v=bbox_bottom;

//Pick
pick_xoff = 7;
pick_yoff = -12;
pick = instance_create_layer(x+pick_xoff, y+pick_yoff, "Player", obj_pick);
pick.climber=self;

target = pick.target;

tm_collision = layer_tilemap_get_id("Collision");

// States
enum PlayerState {
	NEUTRAL,
	JUMP_SQUAT,
	CLIMB,
}

player_state = PlayerState.NEUTRAL;