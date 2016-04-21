
extends TextureButton

onready var textures_player_green = load("res://Assets/Textures/GreenPlayer.png")
onready var textures_player_blue = load("res://Assets/Textures/BluePlayer.png")
onready var textures_player_yellow = load("res://Assets/Textures/YellowPlayer.png")
onready var textures_player_red = load("res://Assets/Textures/RedPlayer.png")
onready var textures_player_purple = load("res://Assets/Textures/PurplePlayer.png")
onready var disable_texture_button_play = load("res://Assets/Textures/PlayButtonDisable.png")
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
	player_information.player_2_color = player[0]["color"]
	player_information.player_3_color = player[0]["color"]
	player_information.player_4_color = player[0]["color"]
	player_information.player_5_color = player[0]["color"]
	set_process(true)

func _process(delta):
	if (number_player.nb_player >= 2) && (number_player.nb_player <= 5):
		if number_player.nb_player >= 2:
			if player_information.player_color == player_information.player_2_color:
				get_parent().get_parent().get_node("Solo/SoloButton").set_disabled(true)
				get_parent().get_parent().get_node("Solo/SoloButton").set_disabled_texture(disable_texture_button_play)
				if number_player.nb_player >=3:
					if (player_information.player_color == player_information.player_3_color) || (player_information.player_2_color == player_information.player_3_color):
						get_parent().get_parent().get_node("Solo/SoloButton").set_disabled(true)
						get_parent().get_parent().get_node("Solo/SoloButton").set_disabled_texture(disable_texture_button_play)
		else:
			get_parent().get_parent().get_node("Solo/SoloButton").set_disabled(false)

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

func _on_TextureButton_pressed():
	if is_pressed():
		count += 1
		if count == 5:
			count = 0
		set_normal_texture(player[count]["texture"])
		player_information.player_2_color = player[count]["color"]


func _on_TextureButton_2_pressed():
	if is_pressed():
		count += 1
		if count == 5:
			count = 0
		set_normal_texture(player[count]["texture"])
		player_information.player_3_color = player[count]["color"]



func _on_TextureButton_3_pressed():
	if is_pressed():
		count += 1
		if count == 5:
			count = 0
		set_normal_texture(player[count]["texture"])
		player_information.player_4_color = player[count]["color"]


func _on_TextureButton_4_pressed():
	if is_pressed():
		count += 1
		if count == 5:
			count = 0
		set_normal_texture(player[count]["texture"])
		player_information.player_5_color = player[count]["color"]
