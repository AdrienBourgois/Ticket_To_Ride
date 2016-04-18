extends Spatial

var wagon_res
var is_occupied
var color 
var material


func _ready():
	wagon_res = preload("res://Scene/Object/wagon.scn")
	is_occupied = false
	get_node("StaticBody").connect("mouse_enter", get_parent(), "_on_hover")
	get_node("StaticBody").connect("mouse_exit", get_parent(), "_off_hover")

func _prepare_space(path_material, i):
	material = path_material
	get_node("StaticBody/quad").set_material_override(material)
	translate(Vector3(0.0, 0.0, i * 3.0))
	
func _place_wagon(player_color):
	var wagon = wagon_res.instance()
	add_child(wagon)
	wagon.get_node("wagon").get_material_override().set_parameter(0, player_color)
	is_occupied = true

func _on_StaticBody_input_event( camera, event, click_pos, click_normal, shape_idx ):
	if event.type == InputEvent.MOUSE_BUTTON and Input.is_mouse_button_pressed(BUTTON_LEFT) and is_occupied == false:
		get_parent().signal_clicked()
	elif event.type == InputEvent.MOUSE_BUTTON and Input.is_mouse_button_pressed(BUTTON_LEFT) and is_occupied == true:
		pass
