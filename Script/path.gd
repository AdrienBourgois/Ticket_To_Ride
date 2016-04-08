extends Spatial

export var color_path = "white"

func _ready():
	pass

func _set_color_path():
	var diffuse = color("red")
	get_node("path/space").set_color(diffuse)