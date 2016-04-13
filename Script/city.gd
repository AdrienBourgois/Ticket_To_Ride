extends StaticBody

var Is_build = false
var Name
var TrainStationScn = preload("res://Scene/train_station.scn")

func _ready():
	pass

func _add_train_station():
	var TrainStation = TrainStationScn.instance()
	add_child(TrainStation)
	Is_build = true



func _on_City_input_event( camera, event, click_pos, click_normal, shape_idx ):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		print("Click on : ",Name)
		if Is_build == false:
			_add_train_station()
