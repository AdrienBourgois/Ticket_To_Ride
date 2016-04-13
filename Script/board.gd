
extends Spatial
var CityScn = preload("res://Scene/city.scn")
var PathScn = preload("res://Scene/path.scn")

var Cities = []
var Paths = []
var Id = 1

func _ready():
	create_world()
	#for City in Cities:
	#	print(City)

func create_world():
	add_city({ "name": "Paris", "pos": Vector3(20, 0, 13) })
	add_city({ "name": "Munich", "pos": Vector3(13, 0, 3) })
	add_city({ "name": "London", "pos": Vector3(16, 0, 9) })
	add_city({ "name": "Madrid", "pos": Vector3(23, 0, -15) })
	add_city({ "name": "Rome", "pos": Vector3(10, 0, -13) })
	add_city({ "name": "Budapest", "pos": Vector3(-1, 0, -5) })
	add_city({ "name": "Sofia", "pos": Vector3(-4, 0, -12) })
	add_city({ "name": "Vilnius", "pos": Vector3(-6, 0, 9) })
	add_city({ "name": "Saint-Petersbourg", "pos": Vector3(-15, 0, 14) })
	add_city({ "name": "Rostov", "pos": Vector3(-15, 0, -5) })
	_add_path({ "pos": Vector3(-4, 0, -10), "Rotation": 340.0, "NbrSpace": 2, "Type": "normal", "color": colors.green})
	_add_path({ "pos": Vector3(-2, 0, -10), "Rotation": 340.0, "NbrSpace": 2, "Type": "normal", "color": colors.blue})
	_add_path({ "pos": Vector3(14, 0, 9), "Rotation": 90.0, "NbrSpace": 7, "Type": "tunnel", "color": colors.red})
	_add_path({ "pos": Vector3(-8, 0, 10), "Rotation": 60.0, "NbrSpace": 3, "Type": "simple ferry", "color": colors.yellow})
	_add_path({ "pos": Vector3(-15, 0, -3), "Rotation": 0.0, "NbrSpace": 6, "Type": "double ferry", "color": colors.pink})
	_add_path({ "pos": Vector3(-6, 0, -11), "Rotation": 60.0, "NbrSpace": 4, "Type": "normal", "color": colors.black})
	_add_path({ "pos": Vector3(22, 0, -13), "Rotation": 15.0, "NbrSpace": 8, "Type": "double ferry", "color": colors.grey})
	_add_path({ "pos": Vector3(18, 0, 11), "Rotation": 315.0, "NbrSpace": 1, "Type": "normal", "color": colors.green})
	_add_path({ "pos": Vector3(0, 0, -3), "Rotation": 300.0, "NbrSpace": 5, "Type": "normal", "color": colors.orange})
	_add_path({ "pos": Vector3(1, 0, -5), "Rotation": 300.0, "NbrSpace": 5, "Type": "normal", "color": colors.white})
	_add_path({ "pos": Vector3(10, 0, -11), "Rotation": 345.0, "NbrSpace": 5, "Type": "normal", "color": colors.green})
	_add_path({ "pos": Vector3(8, 0, -12), "Rotation": 55.0, "NbrSpace": 4, "Type": "normal", "color": colors.grey})
	_add_path({ "pos": Vector3(12, 0, -13), "Rotation": 257.0, "NbrSpace": 4, "Type": "normal", "color": colors.pink})

func add_city(City):
	City["id"] = Id
	Cities.append(City)
	Id += 1
	var New_city = CityScn.instance()
	add_child(New_city)
	New_city.translate(City["pos"])
	New_city.get_node("City").Name = (City["name"])

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
	
	
	