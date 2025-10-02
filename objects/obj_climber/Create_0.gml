//Initialise Properties
run_acc = PLAYER_RUN_ACC;
jump_impulse = PLAYER_JUMP_IMPULSE;
fall_acc = PLAYER_FALL_ACC;

//Movement Values
h_speed_f = 0.0; //h_speed_f is the floating point value of h_speed. It is used to allow for floating point accelerations to be applied.
h_speed = 0; // h_speed is strictly integer and used for collisions and movement. This is the true value.
h_max=6;

v_speed_f = 0.0;
v_speed = 0;
v_max=8;

opposite_move_factor = 4;
stationary_move_factor = 1.2;
further_move_factor = 0.4;

rising_fall_factor = 0.6;
falling_fall_factor = 1.4;
peak_fall_factor = 0.4;
peak_window = 0.3;

ground_friction = 0.2;
air_friction = 0.05;

isJumping=false;

jump_slow_factor = 2;

bbox_h=bbox_right;
bbox_v=bbox_bottom;

//Climbing Values
climb_max = 6;


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