
extends Node

var board = null
var deck = null
var player = null
var gui = null
var server
var client
var players= []

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
	
	
	add_child(board)
	add_child(deck)
	for i in range(number_player.nb_player):
		var new_player = player.instance()
		add_child(new_player)
		print("new_player")
		players.append(new_player)
	#add_child(player)
	add_child(gui)


