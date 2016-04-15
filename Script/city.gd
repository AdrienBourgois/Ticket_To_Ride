extends StaticBody

var Is_build = false
var Name
var TrainStationScn = preload("res://Scene/Object/train_station.scn")
var City_color = null
var material = null

func _ready():
	material = FixedMaterial.new()
	get_node("Quad").set_material_override(material)
	get_node("Quad").get_material_override().set_flag(1, true)
	get_node(".").connect("mouse_enter", self, "_on_hover")
	get_node(".").connect("mouse_exit", self, "_off_hover")


func place_a_station(color):
		var TrainStation = TrainStationScn.instance()
		add_child(TrainStation)
		TrainStation.get_node("TrainStation").get_material_override().set_parameter(0, color)
		Is_build = true


func _on_City_input_event( camera, event, click_pos, click_normal, shape_idx ):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		emit_signal("city_signal", Name, Is_build)
		get_node("/root/Game/Player").action("city", self)


func _on_hover():
	City_color = get_node("Quad").get_material_override().get_parameter(0)
	material.set_parameter(0, colors.purple)

func _off_hover():
	material.set_parameter(0, City_color)