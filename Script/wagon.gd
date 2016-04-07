
extends TestCube

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	_get_color_player(true)
	pass

func _get_color_player(id):
	get_node(".").set_material_override(id)
	pass