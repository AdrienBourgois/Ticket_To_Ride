extends Spatial

# member variables here, example:
# var a=2
# var b="textvar"
var city_scn = preload("res://Scene/city.scn")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	add_child(city_scn.instance())
	pass