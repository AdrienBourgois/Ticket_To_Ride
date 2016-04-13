
extends Node

var Wagons
var Station
var Score
var Hands = preload("res://Scene/hands.scn").instance()
var Player_color
#signal station_signal(param)

func _ready():
	Wagons = 40
	Station = 3
	Score = 0
	Player_color = colors.blue
	add_child(Hands)
	set_process(true)
	get_node("/root/Game/Board/Spatial/City").connect("city_signal", self, "_I_place_a_station")


func _I_place_a_station(param):
	#emit_signal("station_signal", Player_color)
	print("signal recu : ", param)
