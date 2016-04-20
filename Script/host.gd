
extends Button

func _on_Host_pressed():
	mode.server = true
	get_tree().change_scene("res://Scene/General/game.scn")
	if (get_parent().get_node("NamePlayerHost").get_text() == "Enter your name") || (get_parent().get_node("NamePlayerHost").get_text() == ""):
		player_information.player_name = "Player 1"
	else:
		player_information.player_name = get_parent().get_node("NamePlayerHost").get_text()
