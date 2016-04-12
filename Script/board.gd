
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
	add_city({ "name": "Paris", "pos": Vector3(20, 0, 0) })
	add_city({ "name": "Munich", "pos": Vector3(10, 0, 0) })
	add_city({ "name": "London", "pos": Vector3(12, 0, 10) })
	add_city({ "name": "Madrid", "pos": Vector3(22, 0, -15) })
	add_city({ "name": "Rome", "pos": Vector3(10, 0, -12) })
	add_city({ "name": "Budapest", "pos": Vector3(0, 0, -2) })
	add_city({ "name": "Sofia", "pos": Vector3(-5, 0, -12) })
	add_city({ "name": "Vilnius", "pos": Vector3(-8, 0, 8) })
	add_city({ "name": "Saint-Petersbourg", "pos": Vector3(-15, 0, 15) })
	add_city({ "name": "Rostov", "pos": Vector3(-15, 0, -5) })
	#_add_path({ "pos": Vector3(20, 0, 2), "NbrSpace": 6, "Type": "normal", "color": colors.green})
	#_add_path({ "pos": Vector3(12, 0, 12), "NbrSpace": 4, "Type": "normal", "color": colors.red})

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
	New_path._add_space(path["NbrSpace"], path["color"])
	add_child(New_path)
	New_path.translate(path["pos"])