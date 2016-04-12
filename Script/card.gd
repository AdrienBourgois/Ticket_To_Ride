
extends Node

var parameters = {}

func _ready():
	pass

func prepare_card(_parameters, i):
	parameters = _parameters
	
	var material = FixedMaterial.new()
	get_node("Quad").set_material_override(material)
	
	if (parameters["type"] == "wagon"):
		get_node("Quad").translate(Vector3((i % 10)*3, i / 10, 0))
		if (parameters["sub-type"] != "locomotive"):
			get_node("Quad").get_material_override().set_parameter(0, parameters["color-code"])
		elif (parameters["sub-type"] == "locomotive"):
			get_node("Quad").get_material_override().set_parameter(0, colors.cyan)
	elif (parameters["type"] == "road"):
		get_node("Quad").translate(Vector3((i % 10)*3 - 40, i / 10, 0))
		get_node("Quad").get_material_override().set_parameter(0, colors.brown)