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
				//State is free. Try to fall.
				vec4 below = texture2D(u_texture, v_vTexcoord + vec2(0.0, u_texel.y));
		
			    if (below.MATTER == AIR) {	
			        cell.STATE=FREE;
					cell.MATTER=AIR;
			    }
		}
	} else {
		//Matter is air, accept falling matter
		vec4 above = texture2D(u_texture, v_vTexcoord - vec2(0.0, u_texel.y));
	    if (above.MATTER > AIR && above.STATE == FREE) {
			//Accept falling matter.
			cell.MATTER=above.MATTER;
	        cell.STATE=FALLING;
	    }
	}
	
	gl_FragColor=vec4(cell.TEMPERATURE, cell.STATE, cell.MATTER, cell.w);
}
