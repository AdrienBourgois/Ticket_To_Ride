
extends Spatial

var cards = []

func add_card(card):
	cards.append(card)
	add_child(card)

func get_cards():
	var cards_to_return = str2var(var2str(cards))
	
	for card in cards:
		remove_child(card)
		cards.remove(card)
	
	return cards_to_return


