draw_self();

if(DEBUG) {
	draw_set_colour(c_red);
	//Draw Horizontal Collision Check
	draw_line(bbox_h+h_speed, bbox_top, bbox_h+h_speed, bbox_bottom-1);

	//Draw Vertical Collision Check
	draw_line(bbox_left, bbox_v+v_speed, bbox_right, bbox_v+v_speed);
}