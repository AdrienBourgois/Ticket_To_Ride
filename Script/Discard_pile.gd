
extends Spatial

var cards = []

func add_card(card):
	cards.append(card)
	add_child(card)
	print(cards)

func get_cards():
	var cards_to_return = str2var(var2str(cards))
	var id = 0
	
	for card in cards:
		remove_child(card)
		cards.remove(id)
		id += 1
	
	return cards_to_return


