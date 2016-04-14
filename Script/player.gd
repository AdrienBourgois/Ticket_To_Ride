
extends Node

var Wagons
var Station
var Score
var Hands = preload("res://Scene/hands.scn").instance()
var Player_color

func _ready():
	Wagons = 45
	Station = 3
	Score = 0
	Player_color = colors.blue
	add_child(Hands)

func action(type, node):
	if type == "city":
		city_action(node)
	elif type == "card":
		card_action(node)
	elif type == "path":
		path_action(node)

func city_action(node):
	if Station > 0:
		if node.Is_build == false:
			node.place_a_station(Player_color)
			Station -= 1

func path_action(node):
	if Wagons > 0:
		if node.Is_occupied == false:
			node.place_a_path(Player_color)
			Wagons -= node.NbrSpace

func card_action(node):
	pass

