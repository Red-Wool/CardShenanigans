/// @description Insert description here
// You can write your code in this editor

x = mouse_x
y = mouse_y

timer++


if instance_place(x,y,obj_card)
{
	var card = instance_place(x,y,obj_card)
	if card.is_player
	{
		card.extra_y = -20	
	}
	
	if mouse_check_button_pressed(mb_left) and card.can_select and global.game_manager.can_select
	{
		global.game_manager.select_card(card)
	}
}