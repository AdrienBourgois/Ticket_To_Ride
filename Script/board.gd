
extends Spatial
var CityScn = preload("res://Scene/Object/city.scn")
var PathScn = preload("res://Scene/Object/path.scn")
var CardSlotScn = preload("res://Scene/Object/card_location.scn")

var Cities = []
var Paths = []
var Paths_node = []
var Slots = []
var Id = 1

func _ready():
	create_world()
	

func create_world():
	_add_path({ "pos": Vector3(-20.5, 0, 2), "Rotation": 15, "NbrSpace": 5, "Type": "normal", "color": colors.green, "city_A": "Pamplona", "city_B": "Paris"})
	_add_path({ "pos": Vector3(-22, 0, 2), "Rotation": 15, "NbrSpace": 5, "Type": "normal", "color": colors.blue, "city_A": "Pamplona", "city_B": "Paris"})
	_add_path({ "pos": Vector3(-38, 0, 26), "Rotation": -50, "NbrSpace": 2, "Type": "normal", "color": colors.blue, "city_A": "Cadiz", "city_B": "Lisboa"})
	_add_path({ "pos": Vector3(-34, 0, 23.5), "Rotation": 0, "NbrSpace": 2, "Type": "normal", "color": colors.orange, "city_A": "Madrid", "city_B": "Cadiz"})
	_add_path({ "pos": Vector3(-36, 0, 21), "Rotation": 60, "NbrSpace": 2, "Type": "normal", "color": colors.purple, "city_A": "Lisboa", "city_B": "Madrid"})
	_add_path({ "pos": Vector3(-27, 0, 15), "Rotation": 55, "NbrSpace": 4, "Type": "tunnel", "color": colors.black, "city_A": "Pamplona", "city_B": "Madrid"})
	_add_path({ "pos": Vector3(-26, 0, 16), "Rotation": 55, "NbrSpace": 4, "Type": "tunnel", "color": colors.white, "city_A": "Pamplona", "city_B": "Madrid"})
	_add_path({ "pos": Vector3(-26.5, 0, 22.5), "Rotation": 100, "NbrSpace": 3, "Type": "normal", "color": colors.yellow, "city_A": "Barcelona", "city_B": "Madrid"})
	_add_path({ "pos": Vector3(-24.5, 0, 18), "Rotation": 0, "NbrSpace": 2, "Type": "tunnel", "color": colors.grey, "city_A": "Pamplona", "city_B": "Barcelona"})
	_add_path({ "pos": Vector3(-14, 0, 15), "Rotation": 55, "NbrSpace": 5, "Type": "normal", "color": colors.grey, "city_A": "Marseille", "city_B": "Barcelona"})
	_add_path({ "pos": Vector3(-15, 0, 13), "Rotation": 85, "NbrSpace": 4, "Type": "normal", "color": colors.red, "city_A": "Pamplona", "city_B": "Marseille"})
	_add_path({ "pos": Vector3(-31, 0, 1), "Rotation": -20, "NbrSpace": 6, "Type": "normal", "color": colors.purple, "city_A": "Brest", "city_B": "Pamplona"})
	_add_path({ "pos": Vector3(-30, 0, -1), "Rotation": -80, "NbrSpace": 4, "Type": "normal", "color": colors.black, "city_A": "Brest", "city_B": "Paris"})
	_add_path({ "pos": Vector3(-24, 0, -3), "Rotation": -45, "NbrSpace": 2, "Type": "normal", "color": colors.purple, "city_A": "Dieppe", "city_B": "Paris"})
	_add_path({ "pos": Vector3(-3, 0, 18), "Rotation": -15, "NbrSpace": 4, "Type": "ferry", "color": colors.grey, "city_A": "Palermo", "city_B": "Roma"})
	_add_path({ "pos": Vector3(18, 0, 28.5), "Rotation": 90, "NbrSpace": 7, "Type": "double_ferry", "color": colors.grey, "city_A": "Palermo", "city_B": "Smyrna"})
	add_city({ "name": "Cadiz", "pos": Vector3(-34, 0, 28.5) })
	add_city({ "name": "Lisboa", "pos": Vector3(-39, 0, 24) })
	add_city({ "name": "Barcelona", "pos": Vector3(-24.5, 0, 22.5) })
	add_city({ "name": "Pamplona", "pos": Vector3(-25, 0, 14) })
	add_city({ "name": "Paris", "pos": Vector3(-20, 0, 0) })
	add_city({ "name": "Marseille", "pos": Vector3(-13, 0, 13) })
	add_city({ "name": "Brest", "pos": Vector3(-32, 0, -1.5) })
	add_city({ "name": "Munich", "pos": Vector3(-5.5, 0, -1) })
	add_city({ "name": "London", "pos": Vector3(-24, 0, -13) })
	add_city({ "name": "Madrid", "pos": Vector3(-34, 0, 21) })
	add_city({ "name": "Roma", "pos": Vector3(-3.5, 0, 16) })
	add_city({ "name": "Dieppe", "pos": Vector3(-25, 0, -4) })
	add_city({ "name": "Edinburg", "pos": Vector3(-29, 0, -26.5) })
	add_city({ "name": "Amsterdam", "pos": Vector3(-16, 0, -12.5) })
	add_city({ "name": "Bruxelles", "pos": Vector3(-18, 0, -8) })
	add_city({ "name": "Frankfurt", "pos": Vector3(-10, 0, -4.5) })
	add_city({ "name": "Zurich", "pos": Vector3(-11, 0, 5) })
	add_city({ "name": "Essen", "pos": Vector3(-9, 0, -11.5) })
	add_city({ "name": "Venezia", "pos": Vector3(-4, 0, 8) })
	add_city({ "name": "Palermo", "pos": Vector3(-0.5, 0, 28) })
	add_city({ "name": "Brindisi", "pos": Vector3(3, 0, 19) })
	add_city({ "name": "Zagrab", "pos": Vector3(2.5, 0, 9) })
	add_city({ "name": "Sarajevo", "pos": Vector3(9.5, 0, 15) })
	add_city({ "name": "Wien", "pos": Vector3(3.5, 0, 0.7) })
	add_city({ "name": "Berlin", "pos": Vector3(-1, 0, -10) })
	add_city({ "name": "Kobenhavn", "pos": Vector3(-3, 0, -21.5) })
	add_city({ "name": "Stockholm", "pos": Vector3(5, 0, -28) })
	add_city({ "name": "Danzig", "pos": Vector3(8.5, 0, -17.5) })
	add_city({ "name": "Budapest", "pos": Vector3(7.5, 0, 3) })
	add_city({ "name": "Sofia", "pos": Vector3(15, 0, 15) })
	add_city({ "name": "Athina", "pos": Vector3(13.5, 0, 26) })
	add_city({ "name": "Warszawa", "pos": Vector3(12, 0, -11) })
	add_city({ "name": "Wilno", "pos": Vector3(21, 0, -13.5) }) 
	add_city({ "name": "Riga", "pos": Vector3(15, 0, -26) })
	add_city({ "name": "Petrograd", "pos": Vector3(29, 0, -26) })
	add_city({ "name": "Moskva", "pos": Vector3(37, 0, -15) })
	add_city({ "name": "Smolensk", "pos": Vector3(30, 0, -12.5) })
	add_city({ "name": "Kyiv", "pos": Vector3(24, 0, -5.5) })
	add_city({ "name": "Kharkov", "pos": Vector3(35.5, 0, -1) })
	add_city({ "name": "Rostov", "pos": Vector3(39, 0, 4) })
	add_city({ "name": "Sochi", "pos": Vector3(39, 0, 12) })
	add_city({ "name": "Sevastopol", "pos": Vector3(31, 0, 11) })
	add_city({ "name": "Bucuresti", "pos": Vector3(20, 0, 9.5) })
	add_city({ "name": "Erzurum", "pos": Vector3(37, 0, 24) })
	add_city({ "name": "Angora", "pos": Vector3(30, 0, 26) })
	add_city({ "name": "Smyrna", "pos": Vector3(20.5, 0, 28.5) })
	add_city({ "name": "Constantinople", "pos": Vector3(24, 0, 21) })
	_add_slots()

func add_city(City):
	City["id"] = Id
	Cities.append(City)
	Id += 1
	var New_city = CityScn.instance()
	add_child(New_city)
	New_city.prepare_city(City)


func _add_path(path):
	path["id"] = Id
	Paths.append(path)
	var New_path = PathScn.instance()
	New_path.id = Id
	Id += 1
	New_path._set_type_path(path["Type"])
	New_path._add_space(path["NbrSpace"], path["color"])
	add_child(New_path)
	Paths_node.append(New_path)
	New_path.translate(path["pos"])
	New_path.rotate_y(deg2rad(path["Rotation"]))

func _add_slots():
	var CardSlotScn = preload("res://Scene/Object/card_location.scn")
	for i in range(5):
		var slot = CardSlotScn.instance()
		slot.set_translation(Vector3(45,0,-10 + (i*5)))
		Slots.append(slot)
		add_child(slot)
