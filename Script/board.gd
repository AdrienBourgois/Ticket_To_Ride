
extends Spatial
#var CityScn = preload("res://Scene/city.scn")

var Cities = []
var Id = 1

var Paris = { "name": "Paris", "pos": "0, 0, 0" }
var Munich = { "name": "Munich", "pos": "2, 0, 3" }

func _ready():
	#add_child(CityScn.instance())
	create_world()
	for City in Cities:
		print(City)

func create_world():
	add_city(Paris)
	add_city(Munich)

func add_city(CityType):
	var City = str2var(var2str(CityType))
	City["id"] = Id
	Cities.append(City)
	Id += 1