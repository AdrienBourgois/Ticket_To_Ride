extends Spatial

var wagon_res
var is_occupied
var color 
var material



func _ready():
	
	wagon_res = preload("res://Scene/Object/wagon.scn")
	is_occupied = false

func _prepare_space(path_material, i, path_type):
	material = path_material
	get_node("StaticBody/quad").set_material_override(material)
	translate(Vector3(0.0, 0.0, i * 2.5))

func _place_wagon(player_color):
	var wagon_mat = FixedMaterial.new()
	wagon_mat.set_parameter(0, player_color)
	var wagon = wagon_res.instance()
	add_child(wagon)
	get_node("wagon/wagon").set_material_override(wagon_mat)
	wagon.get_node("wagon").get_material_override().set_parameter(0, player_color)
	is_occupied = true

func _on_StaticBody_input_event( camera, event, click_pos, click_normal, shape_idx ):
	if click_pos >= get_node("StaticBody/quad").get_global_transform().origin or click_pos <= get_node("StaticBody/quad").get_global_transform().origin:
		get_parent().get_pos_paths()

	if event.type == InputEvent.MOUSE_BUTTON and Input.is_mouse_button_pressed(BUTTON_LEFT) and is_occupied == false:
		get_parent().signal_clicked()
	elif event.type == InputEvent.MOUSE_BUTTON and Input.is_mouse_button_pressed(BUTTON_LEFT) and is_occupied == true:
		pass
