
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
	_add_path({ "pos": Vector3(20, 0, -14), "Rotation": 72, "NbrSpace": 5, "Type": "normal", "color": colors.green, "city_A": "Madrid", "city_B": "Rome"})
	_add_path({ "pos": Vector3(23, 0, -11), "Rotation": 15, "NbrSpace": 4, "Type": "normal", "color": colors.blue ,"city_A": "Madrid", "city_B": "London" })
	_add_path({ "pos": Vector3(8, 0, -6), "Rotation": -60, "NbrSpace": 4, "Type": "tunnel", "color": colors.red ,"city_A": "London", "city_B": "Rome" })
	#_add_path({ "pos": Vector3(20, 0, 3), "Rotation": 0, "NbrSpace": 4, "Type": "simple ferry", "color": colors.yellow})
	#_add_path({ "pos": Vector3(16, 0, 13), "Rotation": 120, "NbrSpace": 4, "Type": "double ferry", "color": colors.pink})
	#_add_path({ "pos": Vector3(15, 0, 2), "Rotation": 65, "NbrSpace": 3, "Type": "normal", "color": colors.black})
	#Q_add_path({ "pos": Vector3(5, 0, -5), "Rotation": 0, "NbrSpace": 3, "Type": "double ferry", "color": colors.grey})
	#_add_path({ "pos": Vector3(3, 0, -5), "Rotation": 0, "NbrSpace": 3, "Type": "normal", "color": colors.green})
	add_city({ "name": "Cadiz", "pos": Vector3(-23, 0, 35) })
	add_city({ "name": "Lisboa", "pos": Vector3(-27, 0, 29) })
	add_city({ "name": "Barcelona", "pos": Vector3(-16, 0, 28) })
	add_city({ "name": "Pamplona", "pos": Vector3(-17, 0, 17) })
	add_city({ "name": "Paris", "pos": Vector3(-14, 0, 0) })
	add_city({ "name": "Marseille", "pos": Vector3(-9, 0, 16) })
	add_city({ "name": "Brest", "pos": Vector3(-22, 0, -2) })
	add_city({ "name": "Munich", "pos": Vector3(-4, 0, -1.5) })
	add_city({ "name": "London", "pos": Vector3(-16, 0, -16) })
	add_city({ "name": "Madrid", "pos": Vector3(-23, 0, 27) })
	add_city({ "name": "Rome", "pos": Vector3(-2, 0, 20) })
	add_city({ "name": "Dieppe", "pos": Vector3(-17, 0, -5) })
	add_city({ "name": "Edinburg", "pos": Vector3(-20, 0, -33) })
	add_city({ "name": "Amsterdam", "pos": Vector3(-10, 0, -16) })
	add_city({ "name": "Bruxelles", "pos": Vector3(-12, 0, -10) })
	add_city({ "name": "Frankfurt", "pos": Vector3(-7, 0, -6) })
	add_city({ "name": "Zurich", "pos": Vector3(-7, 0, 6) })
	add_city({ "name": "Essen", "pos": Vector3(-6, 0, -14) })
	add_city({ "name": "Venezia", "pos": Vector3(-2, 0, 10) })
	add_city({ "name": "Palermo", "pos": Vector3(0, 0, 35) })
	add_city({ "name": "Brindisi", "pos": Vector3(3, 0, 23) })
	add_city({ "name": "Zagrab", "pos": Vector3(2, 0, 11) })
	add_city({ "name": "Sarajevo", "pos": Vector3(6, 0, 18) })
	add_city({ "name": "Wien", "pos": Vector3(2.6, 0, 0) })
	add_city({ "name": "Berlin", "pos": Vector3(-0.3, 0, -13) })
	add_city({ "name": "Kobenhavn", "pos": Vector3(-2, 0, -27) })
	add_city({ "name": "Stockholm", "pos": Vector3(4, 0, -36) })
	add_city({ "name": "Danzig", "pos": Vector3(6.5, 0, -22) })
	add_city({ "name": "Budapest", "pos": Vector3(6, 0, 3) })
	add_city({ "name": "Sofia", "pos": Vector3(11, 0, 19) })
	add_city({ "name": "Athina", "pos": Vector3(9, 0, 32) })
	add_city({ "name": "Warszawa", "pos": Vector3(8, 0, -14) })
	add_city({ "name": "Wilno", "pos": Vector3(15, 0, -17) }) 
	add_city({ "name": "Riga", "pos": Vector3(10, 0, -32) })
	add_city({ "name": "Petrograd", "pos": Vector3(20, 0, -33) })
	add_city({ "name": "Moskva", "pos": Vector3(25, 0, 19) })
	add_city({ "name": "Smolensk", "pos": Vector3(21, 0, -16) })
	add_city({ "name": "Kyiv", "pos": Vector3(17, 0, -7) })
	add_city({ "name": "Kharkov", "pos": Vector3(25, 0, -1.5) })
	add_city({ "name": "Rostov", "pos": Vector3(27, 0, 4.5) })
	add_city({ "name": "Sochi", "pos": Vector3(27, 0, 15) })
	add_city({ "name": "Sevastopol", "pos": Vector3(22, 0, 13) })
	add_city({ "name": "Bucuresti", "pos": Vector3(14, 0, 12) })
	add_city({ "name": "Erzurum", "pos": Vector3(26, 0, 29) })
	add_city({ "name": "Angora", "pos": Vector3(21, 0, 32) })
	add_city({ "name": "Smyrna", "pos": Vector3(14, 0, 35) })
	add_city({ "name": "Constantinople", "pos": Vector3(16, 0, 26) })
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
