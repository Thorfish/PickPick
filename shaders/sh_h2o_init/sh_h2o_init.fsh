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

bool approx(float val, float val2) {
	return abs(val-val2) < 0.01;	
}

void main() {
    vec4 cell = texture2D(u_texture, v_vTexcoord);
	if (approx(cell.STATE, FALLING)) {
		cell.STATE = FREE;
	}
	
	gl_FragColor=vec4(cell.TEMPERATURE, cell.STATE, cell.MATTER, 1);
}

