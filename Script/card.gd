
extends Node

var parameters = {}

func _ready():
	pass

func prepare_card(_parameters, i):
	parameters = _parameters
	
	var material = FixedMaterial.new()
	get_node("Quad").set_material_override(material)
	get_node("Quad").get_material_override().set_flag(1, true)
	
	if (parameters["type"] == "wagon"):
		get_node("Quad").set_translation(get_node("../Deck_Wagon").get_translation() + Vector3(0,0.02*i,0))
		if (parameters["sub-type"] != "locomotive"):
			get_node("Quad").get_material_override().set_parameter(0, parameters["color-code"])
		elif (parameters["sub-type"] == "locomotive"):
			get_node("Quad").get_material_override().set_parameter(0, colors.cyan)
	elif (parameters["type"] == "road"):
		get_node("Quad").set_translation(get_node("../Deck_Road").get_translation() + Vector3(0,0.02*i,0))
		get_node("Quad").get_material_override().set_parameter(0, colors.brown)

func flip_to(target):
	var tween_t = Tween.new()
	tween_t.set_name("Tween_translate")
	add_child(tween_t)
	tween_t.interpolate_property(get_node("Quad"), "transform/translation", get_node("Quad").get_translation(), target, 2, 0, 0)
	tween_t.interpolate_property(get_node("Quad"), "transform/rotation", Vector3(-270,0,0), Vector3(-90,0,0), 2, 0, 0)
	tween_t.start()
	tween_t.connect("tween_complete", self, "_on_tween_complete")

func _on_tween_complete(object, key):
	pass
	#get_node("Tween").queue_free()