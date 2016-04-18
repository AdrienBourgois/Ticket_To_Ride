
extends Node

export var Wagons = 45
export var Station = 3
var Score
var Hands = preload("res://Scene/Object/hands.scn").instance()
var Player_color = colors.blue

func _ready():
	Score = 0
	add_child(Hands)

func action(type, node):
	if type == "city":
		city_action(node)
	elif type == "card":
		card_action(node)
	elif type == "path":
		path_action(node)

func city_action(node):
	print(node.Name)
	if Station > 0:
		if node.Is_build == false:
			for i in range(node.neighboring_path.size()):
				if node.neighboring_path[i].owner_color == Player_color:
					node.place_a_station(Player_color)
					Station -= 1
					Score -= 4

func path_action(node):
	print(node.id)
	if Wagons >= node.NbrSpace:
		if node.Is_occupied == false:
			node.place_a_path(Player_color)
			Wagons -= node.NbrSpace
			Score += node.NbrSpace

func card_action(node):
	pass
