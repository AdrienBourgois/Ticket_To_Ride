
extends Control

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _on_Online_pressed():
	get_tree().change_scene("res://Scene/General/online_menu.scn")
	pass # replace with function body


func _on_Back_pressed():
	get_tree().change_scene("res://Scene/General/main_menu.scn")
	pass # replace with function body
