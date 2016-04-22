
extends Node

var board = null
var deck = null
var player = null
var gui = null
var discard_pile = null
var server
var client
var players= []

func set_change():
	var change_turn = false
	for i in range(players.size()):
		if change_turn == false:
			if (players[i].your_turn == true):
				change_turn = true
				players[i].your_turn = false
				if i+1 > number_player.nb_player - 1:
					players[0].your_turn = true
					get_child(2).set_player_turn()
				else:
					players[i+1].your_turn = true
					get_child(2).set_player_turn()



func _init():
	if mode.server == true:
		server = load("res://Scene/Object/server.scn").instance()
		add_child(server)
	elif mode.client == true:
		client = load("res://Scene/Object/client.scn").instance()
		add_child(client)
	deck = load("res://Scene/Object/deck.scn").instance()
	board = load("res://Scene/Object/board.scn").instance()
	player = load("res://Scene/Object/player.scn")
	gui = load("res://Scene/General/GuiInGame.scn").instance()
	discard_pile = load("res://Scene/Object/discard_pile.scn").instance()

	add_child(board)
	add_child(deck)
	add_child(gui)
	add_child(discard_pile)

	if (mode.server == true) || (mode.client == true):
		add_child(player)
	else:
		for i in range(number_player.nb_player):
			var new_player = player.instance()
			add_child(new_player)
			players.append(new_player)
		init_players()

func init_players():
	players[0].your_turn = true
	if number_player.nb_player >= 2 && number_player.nb_player <= 5:
		if number_player.nb_player >= 2:
			players[0].Player_color = player_information.player_color
			players[1].Player_color = player_information.player_2_color
			if number_player.nb_player >= 3:
				players[2].Player_color = player_information.player_3_color
				if number_player.nb_player >= 4:
					players[3].Player_color = player_information.player_4_color
					if number_player.nb_player >= 5:
						players[4].Player_color = player_information.player_5_color