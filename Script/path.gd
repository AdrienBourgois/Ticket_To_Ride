extends Spatial

var space_scene = preload("res://Scene/space.scn")
var spaces = []
var NbrSpace = {}
var color = {}
var path_type = {}

func _ready():
	pass

func _add_space(_NbrSpace, _color):
	NbrSpace = _NbrSpace
	color = _color
	for i in range(NbrSpace):
		var space = space_scene.instance()
		space._prepare_space(color,i)
		add_child(space)
		spaces.append(space)

func _set_type_path(_path_type):
	path_type = _path_type

func signal_clicked():
	print("Type : ", path_type)
	for space in spaces:
		space._place_wagon()