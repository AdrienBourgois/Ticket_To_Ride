
extends TextureButton
onready var textures_player_green = load("res://Assets/Textures/ChooseGameMode.png")
onready var textures_player_blue = load("res://Assets/Textures/Credit.png")
onready var textures_player_yellow = load("res://Assets/Textures/MainMenu.png")
onready var textures_player_red = load("res://Assets/Textures/PlusMenu.png")
onready var textures_player_purple = load("res://Assets/Textures/ButtonPlay.png")
var player_image = []
var count = 0

func _ready():
	_create_textures_dictionnary()
	set_normal_texture(textures_player_green)
	set_process(true)

func _process(delta):
	if is_pressed() && count < 5:
		count += 1
		set_pressed_texture(player_image[count])
		set_normal_texture(player_image[count])
		if count == 4:
			count = 0

func add_texture(new_texture):
	var texture = str2var(var2str(new_texture))
	player_image.append(texture)

func _create_textures_dictionnary():
	add_texture(textures_player_green)
	add_texture(textures_player_blue)
	add_texture(textures_player_yellow)
	add_texture(textures_player_red)
	add_texture(textures_player_blue)