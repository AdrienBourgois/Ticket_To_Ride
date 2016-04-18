
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
	set_process_input(true)
	pass

func _input(event):
	if (Input.is_key_pressed(KEY_RIGHT)):
		get_node("Camera").translate(Vector3(1.0, 0.0, 0.0))
	elif (Input.is_key_pressed(KEY_LEFT)):
		get_node("Camera").translate(Vector3(-1.0, 0.0, 0.0))
	elif (Input.is_key_pressed(KEY_UP)):
		get_node("Camera").translate(Vector3(0.0, 1.0, 0.0))
	elif (Input.is_key_pressed(KEY_DOWN)):
		get_node("Camera").translate(Vector3(0.0, -1.0, 0.0))