
extends Node

var parameters = {}

func _init(_parameters):
	parameters = _parameters

func _ready():
	#if(parameters["color"] == "green"):
	get_node("Quad")


