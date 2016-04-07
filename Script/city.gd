
extends StaticBody

# member variables here, example:
# var a=2
# var b="textvar"
var IsClickAble = false
var HaveStation = false
var TrainStationScn = preload("res://Scene/train_station.scn")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	set_process_input(true)
	pass

func _input(event):
	if IsClickAble == true:
		if Input.is_mouse_button_pressed(BUTTON_LEFT):
			if HaveStation == false:
				var TrainStation = TrainStationScn.instance()
				add_child(TrainStation)
				TrainStation.get_node("TrainStation").get_material_override().set_parameter(0, Color(0.0, 1.0, 0.0, 1.0))
				HaveStation = true
			else:
				print("gare already placed")

func _process(delta):
	pass

func _on_City_mouse_enter():
	IsClickAble = true
	pass # replace with function body


func _on_City_mouse_exit():
	IsClickAble = false
	pass # replace with function body
