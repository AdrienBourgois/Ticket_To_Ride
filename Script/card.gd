
extends Node

var parameters = {}
var recto_material = null
var verso_material = null
var color_node = null
var location = ""
var animated = false
var signals_enable = false
var recto_texture = null
var verso_texture = null

func create_texture(color):
	var path = "res://Assets/Textures/CarteWagon_" + color + ".png"
	recto_texture = ImageTexture.new()
	recto_texture.load(path)
	verso_texture = ImageTexture.new()
	verso_texture.load("res://Assets/Textures/CarteWagon.png")

func prepare_card(_parameters, i):
	parameters = str2var(var2str(_parameters))
	
	var recto = get_node("StaticBody/Recto")
	var verso = get_node("StaticBody/Verso")
	var body = get_node("StaticBody")
	
	recto_material = FixedMaterial.new()
	recto.set_material_override(recto_material)
	recto.get_material_override().set_flag(1, true)
	
	verso_material = FixedMaterial.new()
	verso.set_material_override(verso_material)
	verso.get_material_override().set_flag(1, true)
	
	if (parameters["type"] == "wagon"):
		location = "deck_wagon"
		body.set_translation(get_node("../Deck_Wagon").get_translation() + Vector3(0,0.02*i,0))
		if (parameters["sub-type"] != "locomotive"):
			create_texture(parameters["color"])
		elif (parameters["sub-type"] == "locomotive"):
			create_texture("locomotive")
		recto.get_material_override().set_texture(0, recto_texture)
		verso.get_material_override().set_texture(0, verso_texture)
	
	elif (parameters["type"] == "road"):
		location = "deck_road"
		body.set_translation(get_node("../Deck_Road").get_translation() + Vector3(0, 0.02*i, 0))
		recto.get_material_override().set_parameter(0, colors.brown)
	
	color_node = recto.get_material_override().get_parameter(0)

func flip_to(target):
	animated = true
	
	var body = get_node("StaticBody")
	var tween = Tween.new()
	
	tween.set_name("Tween")
	add_child(tween)
	
	tween.interpolate_property(body, "transform/translation", body.get_translation(), target, 2, 6, 1,1)
	tween.interpolate_property(body, "transform/rotation", body.get_rotation(), Vector3(-180,0,0), 2, 6, 2,1)
	tween.start()
	
	tween.connect("tween_complete", self, "_on_tween_complete")

func go_to(target, rotation):
	_off_hover()
	animated = true
	
	var body = get_node("StaticBody")
	var tween = Tween.new()
	
	tween.set_name("Tween")
	add_child(tween)
	
	tween.interpolate_property(body, "transform/translation", body.get_translation(), target, 1, 8, 2)
	tween.interpolate_property(body, "transform/rotation", body.get_rotation(), rotation, 1, 8, 2)
	tween.start()
	
	tween.connect("tween_complete", self, "_on_tween_complete")

func _on_tween_complete(object, key):
	get_node("Tween").queue_free()
	animated = false
	enable_connect()

func _on_clicked(camera, event, click_pos, click_normal, shape_idx):
	if (Input.is_mouse_button_pressed(BUTTON_LEFT) && location == "card_location" && !animated):
		get_node("/root/Game/Player/Hand").add_card(get_parent().return_card())
		disable_connect()
	if (Input.is_mouse_button_pressed(BUTTON_LEFT) && location == "deck_wagon_top" && !animated):
		get_node("/root/Game/Player/Hand").add_card(get_parent().get_card_wagon())
		disable_connect()

func _on_hover():
	if (location == "deck_wagon_top" || location != "deck_wagon"):
		recto_material.set_parameter(0, colors.purple)
		verso_material.set_parameter(0, colors.purple)

func _off_hover():
	if (location == "deck_wagon_top" || location != "deck_wagon"):
		recto_material.set_parameter(0, color_node)
		verso_material.set_parameter(0, color_node)

func enable_connect():
	if (!signals_enable):
		get_node("StaticBody").connect("input_event", self, "_on_clicked")
		get_node("StaticBody").connect("mouse_enter", self, "_on_hover")
		get_node("StaticBody").connect("mouse_exit", self, "_off_hover")
		signals_enable = true

func disable_connect():
	if (signals_enable):
		get_node("StaticBody").disconnect("input_event", self, "_on_clicked")
		get_node("StaticBody").disconnect("mouse_enter", self, "_on_hover")
		get_node("StaticBody").disconnect("mouse_exit", self, "_off_hover")
		signals_enable = false