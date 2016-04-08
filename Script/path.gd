extends Spatial

const red = 0
const green = 1
const blue = 2
const yellow = 3
const pink = 4
const orange = 5
const white = 6
const grey = 7
const black = 8

export (int, "Red", "Green", "Blue", "Yellow", "Pink", "Orange", "White", "Grey", "Black") var color_path

func _ready():
	_set_color_path()
	pass

func _set_color_path():
	if color_path == red:
		get_node("space/space").get_material_override().set_parameter(0, Color(1.0, 0.0, 0.0, 1.0))
	elif color_path == green:
		get_node("space/space").get_material_override().set_parameter(0, Color(0.0, 1.0, 0.0, 1.0))
	elif color_path == blue:
		get_node("space/space").get_material_override().set_parameter(0, Color(0.0, 0.0, 1.0, 1.0))
	elif color_path == yellow:
		get_node("space/space").get_material_override().set_parameter(0, Color(1.0, 1.0, 0.0, 1.0))
	elif color_path == pink:
		get_node("space/space").get_material_override().set_parameter(0, Color(1.0, 0.0, 0.5, 1.0))
	elif color_path == orange:
		get_node("space/space").get_material_override().set_parameter(0, Color(1.0, 0.5, 0.0, 1.0))
	elif color_path == white:
		get_node("space/space").get_material_override().set_parameter(0, Color(1.0, 1.0, 1.0, 1.0))
	elif color_path == grey:
		get_node("space/space").get_material_override().set_parameter(0, Color(0.5, 0.5, 0.5, 1.0))
	elif color_path == black:
		get_node("space/space").get_material_override().set_parameter(0, Color(0.0, 0.0, 0.0, 1.0))