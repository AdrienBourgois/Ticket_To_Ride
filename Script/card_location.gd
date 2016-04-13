
extends Spatial

var id = 0
var card = null

func _init(_id, coord):
	set_translation(coord)
	id = _id

func get_card():
	card = get_node("root/Game/Board/Deck").get_card()
	card.flip_to(get_translation())
	return card

func _ready():
	pass


