
extends TextureButton

onready var textures_player_green = load("res://Assets/Textures/GreenPlayer.png")
onready var textures_player_blue = load("res://Assets/Textures/BluePlayer.png")
onready var textures_player_yellow = load("res://Assets/Textures/YellowPlayer.png")
onready var textures_player_red = load("res://Assets/Textures/RedPlayer.png")
onready var textures_player_purple = load("res://Assets/Textures/PurplePlayer.png")
onready var player_green = { "texture" : textures_player_green, "color" : colors.green}
onready var player_blue = { "texture" : textures_player_blue, "color" : colors.blue}
onready var player_yellow = { "texture" : textures_player_yellow, "color" : colors.yellow}
onready var player_red = { "texture" : textures_player_red, "color" : colors.red}
onready var player_purple = { "texture" : textures_player_purple, "color" : colors.purple}
var player = []
var count = 0

func _ready():
	print(get_parent().get_parent().get_parent().get_parent())
	_create_players_dictionnary()
	set_normal_texture(player[0]["texture"])
	player_information.player_color = player[0]["color"]

func add_player(new_player):
	var _player = str2var(var2str(new_player))
	player.append(_player)

func _create_players_dictionnary():
	add_player(player_green)
	add_player(player_blue)
	add_player(player_yellow)
	add_player(player_red)
	add_player(player_purple)

func _on_Player_pressed():
	if is_pressed():
		count += 1
		if count == 5:
			count = 0
		set_normal_texture(player[count]["texture"])
		player_information.player_color = player[count]["color"]

func _on_Color_pressed():
	if is_pressed():
		count += 1
		if count == 5:
			count = 0
		set_normal_texture(player[count]["texture"])
		player_information.player_color = player[count]["color"]