
extends Button

func _on_Host_pressed():
	get_tree().change_scene("res://Scene/Object/server.scn")

func _on_ValidButton_pressed():
	player_information.player_name = get_parent().get_node("NamePlayerHost").get_text()
