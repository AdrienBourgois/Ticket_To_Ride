extends StaticBody

var Is_build = false
var Name
var TrainStationScn = preload("res://Scene/train_station.scn")
signal city_signal(param)

func _ready():
	#get_node("/root/Game/Player").connect("station_signal", self, "_a_Station_is_placed")
	pass

func _add_train_station():
	var TrainStation = TrainStationScn.instance()
	add_child(TrainStation)
	Is_build = true


func _a_Station_is_placed(param):
	print("signal recu : ", param)


func _on_City_input_event( camera, event, click_pos, click_normal, shape_idx ):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		emit_signal("city_signal", Name)
		print("signal emit : ", Name)
		#print("Click on : ",Name)
		if Is_build == false:
			_add_train_station()
