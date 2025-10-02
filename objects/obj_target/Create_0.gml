if(DEBUG) {
	visible=true;	
}
tm_collision = layer_tilemap_get_id("Collision");

function check_tile_collisions() {	
	if(tilemap_get_at_pixel(tm_collision, x, y) != 0) {
		return true;
	}
	return false;
}