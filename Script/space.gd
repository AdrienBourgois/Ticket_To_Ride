extends Spatial

var wagon_res
var is_occupied
var color = {}

func _ready():
	wagon_res = preload("res://Scene/Object/wagon.scn")
	is_occupied = false

func _on_StaticBody_input_event( camera, event, click_pos, click_normal, shape_idx ):
	if event.type == InputEvent.MOUSE_BUTTON and Input.is_mouse_button_pressed(BUTTON_LEFT) and is_occupied == false:
		get_parent().signal_clicked()
		print("wagon placed")
	elif event.type == InputEvent.MOUSE_BUTTON and Input.is_mouse_button_pressed(BUTTON_LEFT) and is_occupied == true:
		print("wagon already placed")

func _prepare_space(_color, i):
	color = _color
	var material = FixedMaterial.new()
	get_node("quad").set_material_override(material)
	get_node("quad").get_material_override().set_parameter(0, color)
	translate(Vector3(0.0, 0.0, i * 3.0))
	
func _place_wagon():
	var wagon = wagon_res.instance()
	add_child(wagon)
	is_occupied = true