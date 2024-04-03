/// @description Insert description here
// You can write your code in this editor

shader_set(Shader1)
shader_set_uniform_f(_uniTime, timer*.5)
shader_set_uniform_f_array(_str, [.02, .005])
draw_self()
shader_reset()


//draw_sprite_pos
