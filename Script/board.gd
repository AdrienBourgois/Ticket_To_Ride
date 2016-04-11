
extends Spatial
var CityScn = preload("res://Scene/city.scn")

var Cities = []
var Id = 1

func _ready():
	create_world()
	#for City in Cities:
	#	print(City)

func create_world():
	add_city({ "name": "Paris", "pos": Vector3(0, 0, 0) })
	add_city({ "name": "Munich", "pos": Vector3(5, 0, 0) })
	add_city({ "name": "London", "pos": Vector3(10, 0, 0) })

func add_city(CityType):
	var City = str2var(var2str(CityType))
	City["id"] = Id
	Cities.append(City)
	Id += 1
	var New_city = CityScn.instance()
	add_child(New_city)
	New_city.translate(City["pos"])
	New_city.get_node("City").Name = (City["name"])