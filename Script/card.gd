
extends Node

var parameters = {}
var material = null
var color_node = null
var location = ""
var animated = false
var signals_enable = false

func prepare_card(_parameters, i):
	parameters = str2var(var2str(_parameters))
	
	var quad = get_node("StaticBody/Quad")
	var body = get_node("StaticBody")
	
	material = FixedMaterial.new()
	quad.set_material_override(material)
	quad.get_material_override().set_flag(1, true)
	
	if (parameters["type"] == "wagon"):
		location = "deck_wagon"
		body.set_translation(get_node("../Deck_Wagon").get_translation() + Vector3(0,0.02*i,0))
		if (parameters["sub-type"] != "locomotive"):
			quad.get_material_override().set_parameter(0, parameters["color-code"])
		elif (parameters["sub-type"] == "locomotive"):
			quad.get_material_override().set_parameter(0, colors.cyan)
	
	elif (parameters["type"] == "road"):
		location = "deck_road"
		body.set_translation(get_node("../Deck_Road").get_translation() + Vector3(0,0.02*i,0))
		quad.get_material_override().set_parameter(0, colors.brown)
	
	color_node = get_node("StaticBody/Quad").get_material_override().get_parameter(0)

func flip_to(target):
	animated = true
	
	var body = get_node("StaticBody")
	var tween_t = Tween.new()
	
	tween_t.set_name("Tween")
	add_child(tween_t)
	
	tween_t.interpolate_property(body, "transform/translation", body.get_translation(), target, 2, 6, 1,1)
	tween_t.interpolate_property(body, "transform/rotation", Vector3(0,0,0), Vector3(-180,0,0), 2, 6, 2,1)
	tween_t.start()
	
	tween_t.connect("tween_complete", self, "_on_tween_complete")

func _on_tween_complete(object, key):
	get_node("Tween").queue_free()
	animated = false
	if (!signals_enable):
		get_node("StaticBody").connect("input_event", self, "_on_clicked")
		get_node("StaticBody").connect("mouse_enter", self, "_on_hover")
		get_node("StaticBody").connect("mouse_exit", self, "_off_hover")
		signals_enable = true

func _on_clicked(camera, event, click_pos, click_normal, shape_idx):
	if (Input.is_mouse_button_pressed(BUTTON_LEFT) && location == "card_location" && !animated):
		get_parent().return_card()
		get_node("StaticBody").disconnect("input_event", self, "_on_clicked")
		get_node("StaticBody").disconnect("mouse_enter", self, "_on_hover")
		get_node("StaticBody").disconnect("mouse_exit", self, "_off_hover")
		signals_enable = false

func _on_hover():
	material.set_parameter(0, colors.purple)

func _off_hover():
	material.set_parameter(0, color_node)