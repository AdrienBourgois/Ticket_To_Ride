extends Spatial

var space_scene = preload("res://Scene/Object/space.scn")
var spaces = []
var NbrSpace
var color
var path_type
var Is_occupied = false
var material
var owner_color = colors.black
var id

func _ready():
	pass

func place_a_path(player_color):
	for space in spaces:
		space._place_wagon(player_color)
		owner_color = player_color
		Is_occupied = true

func _add_space(_NbrSpace, _color):
	NbrSpace = _NbrSpace
	color = _color
	for i in range(NbrSpace):
		material = FixedMaterial.new()
		material.set_parameter(0, color)
		var space = space_scene.instance()
		add_child(space)
		space._prepare_space(material,i, path_type)
		spaces.append(space)
	
	if path_type == "ferry":
		var img_text = ImageTexture.new()
		img_text.load("res://Assets/Textures/Locomotive.png")
		spaces[0].get_node("StaticBody/quad").get_material_override().set_texture(0, img_text)
	
	if path_type == "double_ferry":
		var img_text = ImageTexture.new()
		img_text.load("res://Assets/Textures/Locomotive.png")
		spaces[0].get_node("StaticBody/quad").get_material_override().set_texture(0, img_text)
		spaces[1].get_node("StaticBody/quad").get_material_override().set_texture(0, img_text)

func _set_type_path(_path_type):
	path_type = _path_type

func signal_clicked():
	get_node("/root/Game/Player").action("path", self)