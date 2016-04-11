extends Spatial

var path = { "NbrSpace": "4", "Type": "normal", "color": Color(0.0,1.0,0.0,1.0)}#colors.green

var space_scene = preload("res://Scene/space.scn")

func _ready():
	_set_type_path()
	var space = space_scene.instance()
	add_child(space)
	space.parameter = path["color"]
	space._set_color_space()
	pass

func _set_type_path():
	pass