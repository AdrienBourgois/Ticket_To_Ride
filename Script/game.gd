
extends Node

var board = null
var deck = null
var player = null
var gui = null
func _init():
	
	deck = load("res://Scene/Object/deck.scn").instance()
	board = load("res://Scene/Object/board.scn").instance()
	player = load("res://Scene/Object/player.scn").instance()
	gui = load("res://Scene/General/GuiInGame.scn").instance()
	
	add_child(board)
	add_child(deck)
	add_child(player)
	add_child(gui)

func _ready():

	pass