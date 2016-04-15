extends StaticBody

var Is_build = false
var Name
var TrainStationScn = preload("res://Scene/Object/train_station.scn")
signal city_signal(city, occuped)

func _ready():
	get_node("/root/Game/Player").connect("player_signal", self, "_a_Station_is_placed")
	pass


func _a_Station_is_placed(city, color):
	if city == Name:
		var TrainStation = TrainStationScn.instance()
		add_child(TrainStation)
		TrainStation.get_node("TrainStation").get_material_override().set_parameter(0, color)
		Is_build = true


func _on_City_input_event( camera, event, click_pos, click_normal, shape_idx ):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		emit_signal("city_signal", Name, Is_build)
