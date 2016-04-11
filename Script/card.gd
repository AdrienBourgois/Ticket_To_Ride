
extends Node

var parameters = {}

func _ready():
	pass

func prepare_card(_parameters, i):
	parameters = _parameters
	if (parameters["type"] == "wagon"):
		if (parameters["sub-type"] != "locomotive"):
			var material = FixedMaterial.new()
			get_node("Quad").translate(Vector3((i % 10)*3, i / 10, 0))
			get_node("Quad").set_material_override(material)
			get_node("Quad").get_material_override().set_parameter(0, parameters["color-code"])
		elif (parameters["sub-type"] == "locomotive"):
			var material = FixedMaterial.new()
			get_node("Quad").translate(Vector3((i % 10)*3, i / 10, 0))
			get_node("Quad").set_material_override(material)
			get_node("Quad").get_material_override().set_parameter(0, colors.cyan)