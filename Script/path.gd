extends Spatial

var space_scene = preload("res://Scene/space.scn")
var spaces = []
var id = 1
var NbrSpace = {}
var color = {}

func _ready():
	#_set_type_path()
	pass

func _add_space(_NbrSpace, _color):
	NbrSpace = _NbrSpace
	color = _color
	for i in range(NbrSpace):
		var space = space_scene.instance()
		space._prepare_space(color,i)
		add_child(space)
		spaces.append(space)

 """func _set_type_path():
	if path["Type"] == "normal":
		print("Road normal")
	if path["Type"] == "tunnel":
		print("Tunnel")
		print("Pioche 3 Cards")
	if path["Type"] == "simple ferry":
		print("Simple ferry")
	if path["Type"] == "double ferry":
		print("Double ferry")"""

func signal_clicked():
	for space in spaces:
		space._place_wagon()