
extends Node

export var Wagons = 45
export var Station = 3
var Score
var Hands = preload("res://Scene/Object/hands.scn").instance()
var Player_color
var your_turn = false

func _ready():
	Score = 0
	get_parent().get_node("GuiInGame").set_wagon_value(Wagons)
	get_parent().get_node("GuiInGame").set_station_value(Station)
	get_parent().get_node("GuiInGame").set_score_value(Score)
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
	if your_turn == true:
		var path_find = false
		if Station > 0:
			if node.Is_build == false:
				for i in range(node.neighboring_path.size()):
					if path_find == false:
						if node.neighboring_path[i].owner_color == Player_color:
							node.place_a_station(Player_color)
							Station -= 1
							Score -= 4 #temporaire, doit rajouter 4 point par gare non poser en fin de partie 
							get_parent().get_node("GuiInGame").set_station_value(Station)
							get_parent().get_node("GuiInGame").set_score_value(Score)
							path_find = true
							get_parent().set_change()


func path_action(node):
	if your_turn == true:
		print(node.id)
		if Wagons >= node.NbrSpace:
			if node.Is_occupied == false:
				node.place_a_path(Player_color)
				Wagons -= node.NbrSpace
				Score += node.NbrSpace
				get_parent().get_node("GuiInGame").set_wagon_value(Wagons)
				get_parent().get_node("GuiInGame").set_score_value(Score)
				get_parent().set_change()

func card_action(node):
	pass