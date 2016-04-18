extends Control

func _ready():
	set_process_input(true)

func _input(event):
	if event.type == InputEvent.KEY:
		get_tree().change_scene("res://Scene/General/main_menu.scn")
