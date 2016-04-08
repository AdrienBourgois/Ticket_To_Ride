
extends StaticBody
var IsClickAble = false
var HaveStation = false
var TrainStationScn = preload("res://Scene/train_station.scn")

func _ready():
	set_process(true)

func _process(delta):
	if IsClickAble == true:
		if Input.is_mouse_button_pressed(BUTTON_LEFT):
			if HaveStation == false:
				_add_train_station()
			else:
				print("gare already placed")

func _add_train_station():
	var TrainStation = TrainStationScn.instance()
	add_child(TrainStation)
	TrainStation.get_node("TrainStation").get_material_override().set_parameter(0, Color(0.0, 1.0, 0.0, 1.0))
	HaveStation = true


func _on_City_mouse_enter():
	IsClickAble = true


func _on_City_mouse_exit():
	IsClickAble = false