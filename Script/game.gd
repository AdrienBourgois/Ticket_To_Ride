
extends Node

var board = null
var deck = null
var player = null

func _init():
	
	deck = load("res://Scene/Object/deck.scn").instance()
	board = load("res://Scene/Object/board.scn").instance()
	player = load("res://Scene/Object/player.scn").instance()
	add_child(board)
	add_child(deck)
	add_child(player)

func _ready():
	pass


