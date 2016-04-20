
extends TextureButton

func _on_SoloButton_pressed():
	if (get_parent().get_node("LineEdit").get_text() == "Enter your name") || (get_parent().get_node("LineEdit").get_text() == ""):
		player_information.player_name = "Player 1"
	else:
		player_information.player_name = get_parent().get_node("LineEdit").get_text()
	get_tree().change_scene("res://Scene/General/game.scn")
