attribute vec3 in_Position;        // vertex position
attribute vec4 in_Colour;          // vertex color (usually white)
attribute vec2 in_TextureCoord;    // UV coordinates

varying vec2 v_vTexcoord;          // pass UV to fragment
varying vec4 v_vColour;            // pass color to fragment

void main() {
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;	
    v_vColour = in_Colour;       // pass color through
    v_vTexcoord = in_TextureCoord; // PASS UVS! This is essential
}