/// @description Insert description here
// You can write your code in this editor

card_type = 0
can_select = false
is_player = false

target_x = x
target_y = y

extra_x = 0
extra_y = 0

timer = 0
_uniTime  = shader_get_uniform(Shader1, "_u_time");
_str = shader_get_uniform(Shader1, "_str")


function unreveal()
{
	sprite_index = spr_back
}

function reveal()
{
	switch(card_type)
	{
		case 0:
			sprite_index = spr_rock
			break
		case 1:	
			sprite_index = spr_paper
			break
		case 2:
			sprite_index = spr_scissors
			break
	}
}