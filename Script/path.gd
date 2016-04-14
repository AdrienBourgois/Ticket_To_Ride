extends Spatial

var space_scene = preload("res://Scene/space.scn")
var spaces = []
var NbrSpace
var color
var path_type
var Is_occupied = false
var material

func _ready():
	pass

func place_a_path(player_color):
	for space in spaces:
		space._place_wagon(player_color)
		Is_occupied = true

func _add_space(_NbrSpace, _color):
	NbrSpace = _NbrSpace
	color = _color
	material = FixedMaterial.new()
	material.set_parameter(0, color)
	for i in range(NbrSpace):
		var space = space_scene.instance()
		add_child(space)
		space._prepare_space(material,i)
		spaces.append(space)

func _on_hover():
	material.set_parameter(0, colors.purple)

func _off_hover():
	material.set_parameter(0, color)

func _set_type_path(_path_type):
	path_type = _path_type

func signal_clicked():
	get_node("/root/Game/Player").action("path", self)