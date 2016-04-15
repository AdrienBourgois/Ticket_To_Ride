
extends Node

var Wagons
var Station
var Score
var Hands = preload("res://Scene/Object/hands.scn").instance()
var Player_color
signal player_signal(city, color)

func _ready():
	Wagons = 40
	Station = 3
	Score = 0
	Player_color = colors.purple
	add_child(Hands)
	set_process(true)
	
	for i in range(get_node("/root/Game/Board").get_child_count()):
		if get_node("/root/Game/Board").get_child(i).get_type() == "StaticBody":
			get_node("/root/Game/Board").get_child(i).connect("city_signal", self, "_I_place_a_station")

func _I_place_a_station(city, occuped):
	if Station > 0 && occuped == false:
		emit_signal("player_signal", city, Player_color)
		print("station is placed in ", city)
		Station -= 1
	else:
		print("can't placed a station in ", city)
