
extends Spatial

var id = 0
var card = null
var claim = true

func get_card():
	card = get_node("/root/Game/Deck").get_card_wagon()
	if (card != null):
		add_child(card)
		card.flip_to(get_translation())
		card.location = "card_location"

func return_card():
	remove_child(card)
	var card_to_return = card
	card = null
	return card_to_return

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	if (card == null && claim):
		get_card()


