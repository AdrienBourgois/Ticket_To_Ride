
extends Spatial
var CityScn = preload("res://Scene/Object/city.scn")
var PathScn = preload("res://Scene/Object/path.scn")
var CardSlotScn = preload("res://Scene/Object/card_location.scn")

var Cities = []
var Paths = []
var Slots = []
var Id = 1

func _ready():
	create_world()

func create_world():
	add_city({ "name": "Paris", "pos": Vector3(20, 0, 15) })
	add_city({ "name": "Munich", "pos": Vector3(5, 0, 5) })
	add_city({ "name": "London", "pos": Vector3(19, 0, 0) })
	add_city({ "name": "Madrid", "pos": Vector3(23, 0, -15) })
	add_city({ "name": "Rome", "pos": Vector3(5, 0, -9) })
	_add_path({ "pos": Vector3(20, 0, -14), "Rotation": 72, "NbrSpace": 5, "Type": "normal", "color": colors.green})
	_add_path({ "pos": Vector3(23, 0, -11), "Rotation": 15, "NbrSpace": 4, "Type": "normal", "color": colors.blue})
	_add_path({ "pos": Vector3(8, 0, -6), "Rotation": -60, "NbrSpace": 4, "Type": "tunnel", "color": colors.red})
	_add_path({ "pos": Vector3(20, 0, 3), "Rotation": 0, "NbrSpace": 4, "Type": "simple ferry", "color": colors.yellow})
	_add_path({ "pos": Vector3(16, 0, 13), "Rotation": 120, "NbrSpace": 4, "Type": "double ferry", "color": colors.pink})
	_add_path({ "pos": Vector3(15, 0, 2), "Rotation": 65, "NbrSpace": 3, "Type": "normal", "color": colors.black})
	_add_path({ "pos": Vector3(5, 0, -5), "Rotation": 0, "NbrSpace": 3, "Type": "double ferry", "color": colors.grey})
	_add_path({ "pos": Vector3(3, 0, -5), "Rotation": 0, "NbrSpace": 3, "Type": "normal", "color": colors.green})
	_add_slots()

func add_city(City):
	City["id"] = Id
	Cities.append(City)
	Id += 1
	var New_city = CityScn.instance()
	add_child(New_city)
	New_city.translate(City["pos"])
	New_city.Name = (City["name"])

func _add_path(PathType):
	var path = str2var(var2str(PathType))
	path["id"] = Id
	Paths.append(path)
	Id += 1
	var New_path = PathScn.instance()
	New_path._set_type_path(path["Type"])
	New_path._add_space(path["NbrSpace"], path["color"])
	add_child(New_path)
	New_path.translate(path["pos"])
	New_path.rotate_y(deg2rad(path["Rotation"]))

func _add_slots():
	var CardSlotScn = preload("res://Scene/Object/card_location.scn")
	for i in range(5):
		var slot = CardSlotScn.instance()
		slot.set_translation(Vector3(45,0,-10 + (i*5)))
		Slots.append(slot)
		add_child(slot)
