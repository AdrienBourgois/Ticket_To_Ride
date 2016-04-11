extends Spatial

var wagon_res
var is_occupied
var parameter

func _ready():
	wagon_res = preload("res://Scene/wagon.scn")
	is_occupied = false

func _on_StaticBody_input_event( camera, event, click_pos, click_normal, shape_idx ):
	if event.type == InputEvent.MOUSE_BUTTON and Input.is_mouse_button_pressed(BUTTON_LEFT) and is_occupied == false:
		var wagon = wagon_res.instance()
		add_child(wagon)
		print("wagon placed")
		is_occupied = true
	elif event.type == InputEvent.MOUSE_BUTTON and Input.is_mouse_button_pressed(BUTTON_LEFT) and is_occupied == true:
		print("wagon already placed")

func _set_color_space():
	get_node("space").get_material_override().set_parameter(0, parameter)