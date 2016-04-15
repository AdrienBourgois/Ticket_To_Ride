
extends Node

var board = null
var deck = null
var player = null
var gui = null
func _init():
	
	deck = load("res://Scene/deck.scn").instance()
	board = load("res://Scene/board.scn").instance()
	player = load("res://Scene/player.scn").instance()
	gui = load("res://Scene/GuiInGame.scn").instance()
	add_child(board)
	add_child(deck)
	add_child(player)
	add_child(gui)

func _ready():
	pass