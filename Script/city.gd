extends StaticBody

var Is_build = false
var Name
var TrainStationScn = preload("res://Scene/Object/train_station.scn")
var City_color = null
var material = null
var neighboring_path = []
var Path_dictionary
var Path_node

func _ready():
	material = FixedMaterial.new()
	get_node("Quad").set_material_override(material)
	get_node("Quad").get_material_override().set_flag(1, true)
	self.connect("mouse_enter", self, "_on_hover")
	self.connect("mouse_exit", self, "_off_hover")
	Path_dictionary = get_node("/root/Game/Board").Paths
	Path_node = get_node("/root/Game/Board").Paths_node

func prepare_city(city):
	self.translate(city["pos"])
	Name = (city["name"])
	var path_id
	
	for path in Path_dictionary:
		if path["city_A"] == Name || path["city_B"] == Name:
			path_id = path["id"]
			for node in Path_node:
				if node.id == path_id:
					neighboring_path.append(node)
	



func place_a_station(color):
		var TrainStation = TrainStationScn.instance()
		add_child(TrainStation)
		TrainStation.get_node("TrainStation").get_material_override().set_parameter(0, color)
		Is_build = true


func _on_City_input_event( camera, event, click_pos, click_normal, shape_idx ):
	if click_pos >= get_node("Quad").get_global_transform().origin or click_pos <= get_node("Quad").get_global_transform().origin:
		print("yes")

	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		get_node("/root/Game/Player").action("city", self)


func _on_hover():
	City_color = get_node("Quad").get_material_override().get_parameter(0)
	material.set_parameter(0, colors.purple)

func _off_hover():
	material.set_parameter(0, City_color)