/// @description Insert description here
// You can write your code in this editor


shader_set(Shader1)
shader_set_uniform_f(_uniTime, timer)
shader_set_uniform_f_array(_str, [.05, .05])
draw_self()
shader_reset()
