extends Spatial

var paths = []
var id = 1

var path = { "NbrSpace": "8", "Type": "normal", "color": "red"}
var path2 = { "NbrSpace": "4", "Type": "normal", "color": "green"}

var space_scene = preload("res://Scene/space.scn")

func _ready():
	_set_type_path()
	pass

func _set_type_path():
	pass