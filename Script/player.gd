
extends Node

export var Wagons = 45
export var Station = 3
var Score
var Hands = preload("res://Scene/Object/hands.scn").instance()
var Player_color
var your_turn = false

func _ready():
	Score = 0
	if number_player.nb_player >= 2:
		get_parent().get_node("GuiInGame/PanelPlayer/wagon/value").set_text(str(Wagons))
		get_parent().get_node("GuiInGame/PanelPlayer1/wagon/value").set_text(str(Wagons))
		get_parent().get_node("GuiInGame/PanelPlayer/train_station/value").set_text(str(Station))
		get_parent().get_node("GuiInGame/PanelPlayer1/train_station/value").set_text(str(Station))
		if number_player.nb_player >= 3:
			get_parent().get_node("GuiInGame/PanelPlayer2/wagon/value").set_text(str(Wagons))
			get_parent().get_node("GuiInGame/PanelPlayer2/train_station/value").set_text(str(Station))
			if number_player.nb_player >= 4:
				get_parent().get_node("GuiInGame/PanelPlayer3/wagon/value").set_text(str(Wagons))
				get_parent().get_node("GuiInGame/PanelPlayer3/train_station/value").set_text(str(Station))
				if number_player.nb_player == 5:
					get_parent().get_node("GuiInGame/PanelPlayer4/wagon/value").set_text(str(Wagons))
					get_parent().get_node("GuiInGame/PanelPlayer4/train_station/value").set_text(str(Station))
 
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
	if your_turn == true:
		print(node.Name)
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
		if Hands.request_card(node.color_str, node.NbrSpace) == true:
			if Wagons >= node.NbrSpace:
				if node.Is_occupied == false:
					node.place_a_path(Player_color)
					Wagons -= node.NbrSpace
					Score += node.NbrSpace
					Hands.remove_card(node.color_str, node.NbrSpace)
					get_parent().get_node("GuiInGame").set_wagon_value(Wagons)
					get_parent().get_node("GuiInGame").set_score_value(Score)
					get_parent().set_change()
				if Wagons >= 0 && Wagons <= 2:
					get_tree().change_scene("res://Scene/General/gui_game_over.scn")

func card_action(node):
	pass