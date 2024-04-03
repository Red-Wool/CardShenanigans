if make_cards
{
	
	var card_copy = instance_create_depth(100, 100 + card_count*10,card_count, obj_card)
	card_copy.target_x = 100
	card_copy.target_y = 100 + card_count*10
	
	ds_list_add(cards, card_copy)
	
	card_copy.card_type = irandom_range(0,2)
	card_copy.is_player = false
	card_copy.timer = card_count * 20
	
	card_count++
	
	if (card_count >= 24)
	{
		make_cards = false
		card_count = 0
	}
}

if !can_select and !do_deal and !playing and keyboard_check_pressed(vk_enter)
{
	do_deal = true
	deal_cards_time = 0
}

if (do_deal)
{
	deal_cards_time++
	if deal_cards_time > 10
	{
		var c = cards[| 0]
		ds_list_add(cards_in_play, c)
		ds_list_delete(cards, 0)
		//cards_in_play[dealt_cards] = cards[card_count]
		
		if dealt_cards < 3
		{
			
			card_count++
			c.target_x = 400 + 180 * (dealt_cards % 3)
			c.target_y = 450
			c.is_player = true
			c.can_select = true
			c.reveal()
		}
		else
		{
			card_count++
			c.target_x = 400 + 180 * (dealt_cards % 3)
			c.target_y = 50
			c.is_player = false
			c.can_select = false
		}

		
		dealt_cards++
		deal_cards_time = 0
		
		if dealt_cards >= 6
		{
			dealt_cards = 0
			do_deal = false
			can_select = true
		}
	}
}