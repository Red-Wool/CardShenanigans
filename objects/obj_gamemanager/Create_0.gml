global.game_manager = self

player_score = 0
enemy_score = 0

make_cards = true
card_count = 0

do_deal = false
deal_cards_time = 0
dealt_cards = 0

playing = false

win_text = ""

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
		//This id is hell
		audio_play_sound(Minecraft_Chest_Opening___QuickSounds_com__AudioTrimmer_com_, 10, 0, .1)
	}
	else if (selected_card.card_type + 1) % 3 == enemy_card.card_type 
	{ //Lose
		enemy_score++
		audio_play_sound(Kirby_screaming_and_falling, 10, 0, .1)
		if (enemy_score >= 6)
		{
			win_text = "Enemy Wins!"
			
		}
	}
	else
	{ //Win
		player_score++
		audio_play_sound(nioce, 10, 0, .5)
		if (player_score >= 6)
		{
			win_text = "Player Wins!"
			
		}
	}
	
	for (var i = 0; i < 6; i++)
	{
		ds_list_add(discard_pile, cards_in_play[| i])
		cards_in_play[| i].target_x = 1000
		cards_in_play[| i].target_y = 340-10*(ds_list_size(discard_pile)-1)
		cards_in_play[| i].depth = -ds_list_size(discard_pile)*10
	}
	
	if win_text != ""
	{
		return
	}
	
	
	cards_in_play = ds_list_create()
	
	if (ds_list_size(discard_pile) == 24)
	{
		ds_list_shuffle(discard_pile)
		
		cards = ds_list_create()
		
		
		for (var i = 0; i < 24; i++)
		{
			ds_list_add(cards, discard_pile[| i])
		}

		for (var i = 0; i < 24; i++)
		{
			cards[| i].sprite_index = spr_back
			cards[| i].target_x = 100
			cards[| i].target_y = 100 + i*10
			cards[| i].depth = -i * 10
			
		}
		
		audio_play_sound(paper_rustling, 0, 0)
		discard_pile = ds_list_create()
	}
	
	
	randomize()
	playing = false
}