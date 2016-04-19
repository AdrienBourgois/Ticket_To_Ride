
extends Node

var wagon_cards = []
var road_cards = []

func _ready():
	print(get_translation())
	print(get_rotation())
	translate(Vector3(0.0, 0.0, 40.0))
	rotate_x(rad2deg(-17.0))

func add_card(card):
	add_child(card)
	card.go_to(get_translation(), get_rotation())
