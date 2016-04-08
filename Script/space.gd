extends Spatial

var wagon_res
var is_occupied

func _ready():
	wagon_res = preload("res://Scene/wagon.scn")
	is_occupied = false
	pass

func _on_StaticBody_input_event( camera, event, click_pos, click_normal, shape_idx ):
	if event.type == InputEvent.MOUSE_BUTTON and Input.is_mouse_button_pressed(BUTTON_LEFT) and is_occupied == false:
		var wagon = wagon_res.instance()
		add_child(wagon)
		print("lol")
		is_occupied = true
	pass # replace with function body
