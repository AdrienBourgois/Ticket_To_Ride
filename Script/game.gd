
extends Node

var board = null
var deck = null

func _init():
	deck = load("res://Scene/deck.scn").instance()
	board = load("res://Scene/board.scn").instance()
	add_child(board)
	add_child(deck)

func _ready():
	pass


