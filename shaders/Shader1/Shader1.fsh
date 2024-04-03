//
// Simple passthrough fragment shader
//
uniform float _u_time;
uniform vec2 _str;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord + 
	vec2(floor(sin(v_vTexcoord.y*10. + _u_time*.03)*4.)*.25 * _str.x, floor(sin(v_vTexcoord.y*3. + _u_time*.1)*2.)*.5 * _str.y));
}