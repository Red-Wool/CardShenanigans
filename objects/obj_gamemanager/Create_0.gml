global.game_manager = self

player_score = 0
enemy_score = 0

make_cards = true
card_count = 0

do_deal = false
deal_cards_time = 0
dealt_cards = 0

playing = false

cards = ds_list_create()
selected_card = pointer_null
enemy_card = pointer_null
cards_in_play = ds_list_create()
discard_pile = ds_list_create()

can_select = false

audio_play_sound(Fez17___Death, 10, 1, .5)

randomize()

function select_card(card)
{
	selected_card = card
	selected_card.target_x = 580
	selected_card.target_y = 300
	selected_card.is_player = false
	selected_card.depth = -1000
	
	can_select = false
	playing = true
	
	alarm[0] = 120
}

function check_win()
{
	if selected_card.card_type == enemy_card.card_type
	{ //Tie
			
	}
	else if (selected_card.card_type + 1) % 3 == enemy_card.card_type 
	{ //Lose
		enemy_score++
	}
	else
	{ //Win
		player_score++
	}
	
	for (var i = 0; i < 6; i++)
	{
		ds_list_add(discard_pile, cards[| i])
		cards_in_play[| i].target_x = 900
		cards_in_play[| i].target_y = 340-10*(ds_list_size(discard_pile)-1)
		
	}
	cards_in_play = ds_list_create()
	
	//if ()
	
	playing = false
}