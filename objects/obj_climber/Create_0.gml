//Macros
#macro DEBUG 0

//Initialise Properties
run_speed = 4;
jump_speed = 10;
fall_speed = 1;
h_speed = 0;
v_speed = 0;

bbox_h=bbox_right;
bbox_v=bbox_bottom;

//Pick
pick_xoff = 7;
pick_yoff = -12;
pick = instance_create_layer(x+pick_xoff, y+pick_yoff, "Player", obj_pick);


tilemap = layer_tilemap_get_id("Snow_Tiles");