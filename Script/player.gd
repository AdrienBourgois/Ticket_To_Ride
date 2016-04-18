
extends Node

export var Wagons = 45
export var Station = 3
var Score
var Hands = preload("res://Scene/Object/hands.scn").instance()
var Player_color

func _ready():
	Score = 0
	get_parent().get_node("GuiInGame").set_wagon_value(Wagons)
	get_parent().get_node("GuiInGame").set_station_value(Station)
	get_parent().get_node("GuiInGame").set_score_value(Score)
	add_child(Hands)
	Player_color = player_information.player_color

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
			Score -= 4
			get_parent().get_node("GuiInGame").set_station_value(Station)
			get_parent().get_node("GuiInGame").set_score_value(Score)

func path_action(node):
	if Wagons >= node.NbrSpace:
		if node.Is_occupied == false:
			node.place_a_path(Player_color)
			Wagons -= node.NbrSpace
			Score += node.NbrSpace
			get_parent().get_node("GuiInGame").set_wagon_value(Wagons)
			get_parent().get_node("GuiInGame").set_score_value(Score)

func card_action(node):
	pass