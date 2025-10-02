varying vec2 v_vTexcoord;
uniform sampler2D u_texture;
uniform vec2 u_texel;

//TEMPERATURE
#define TEMPERATURE r
#define DEG50 1.0
#define DEG0 0.5
#define DEGN50 0

//STATE
#define	STATE g
#define STABLE 1.0
#define FALLING 0.5
#define FREE 0.0

//MATTER
#define MATTER b
#define ICE 1.0
#define SNOW 0.8
#define WSNOW 0.6
#define WATER 0.2
#define AIR 0.0

#define ICE_COLOUR vec4(0.639, 0.745, 0.804, 1.0)
#define SNOW_COLOUR vec4(0.898, 0.98, 1.0, 1.0)
#define WSNOW_COLOUR vec4(0.788, 0.973, 1.0, 1.0)
#define WATER_COLOUR vec4(0.157, 0.361, 0.804, 1.0)
#define AIR_COLOUR vec4(0.0, 0.0, 0.0, 0.0)

void main() {
    vec4 cell = texture2D(u_texture, v_vTexcoord);

	//Falling Behaviour
	if(cell.MATTER > AIR) {
		//MATTER is greater than air
		if(cell.STATE == FREE) {
				//State is free. Try to fall diagonal.
				vec4 below_left;
				vec4 below_right;
				if (v_vTexcoord.y + u_texel.y > 1.0) {
					below_left = cell;
					below_right = cell;
				} else {
					below_left = texture2D(u_texture, v_vTexcoord + vec2(0, u_texel.y) - vec2(u_texel.x, 0));
					below_right = texture2D(u_texture, v_vTexcoord + vec2(0, u_texel.y) + vec2(u_texel.x, 0));
				}
			    if (below_left.MATTER == AIR) {	
			        cell.STATE=FREE;
					cell.MATTER=AIR;
			    } else if (below_right.MATTER == AIR) {
					cell.STATE=FREE;
					cell.MATTER=AIR;
				}
		}
	} else {
		//Matter is air, accept falling diagonal matter
		vec4 above_right = texture2D(u_texture, v_vTexcoord - vec2(0, u_texel.y) + vec2(u_texel.x, 0));
		vec4 above_left = texture2D(u_texture, v_vTexcoord - vec2(0, u_texel.y) - vec2(u_texel.x, 0));
	    if (above_right.MATTER > AIR && above_right.STATE == FREE) {
			//Accept falling matter.
			cell.MATTER=above_right.MATTER;
	        cell.STATE=FALLING;
	    } else if(above_left.MATTER > AIR && above_left.STATE == FREE) {
			cell.MATTER=above_left.MATTER;
	        cell.STATE=FALLING;
		}
	}
	
	gl_FragColor=vec4(cell.TEMPERATURE, cell.STATE, cell.MATTER, cell.w);
}
