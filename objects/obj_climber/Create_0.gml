//Macros
#macro DEBUG 0

//Initialise Properties
run_speed = PLAYER_RUN_SPEED;
jump_speed = PLAYER_JUMP_SPEED;
fall_speed = PLAYER_FALL_SPEED;
h_speed = 0;
v_speed = 0;

bbox_h=bbox_right;
bbox_v=bbox_bottom;

//Pick
pick_xoff = 7;
pick_yoff = -12;
pick = instance_create_layer(x+pick_xoff, y+pick_yoff, "Player", obj_pick);
pick.climber=self;

tilemap = layer_tilemap_get_id("Collision");

// States
enum PlayerState {
	IDLE,
	RUN,
	JUMP,
	JUMP_SQUAT,
}