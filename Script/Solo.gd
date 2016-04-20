
extends TextureButton

func _on_SoloButton_pressed():
	if (get_parent().get_node("LineEdit").get_text() == "Enter your name") || (get_parent().get_node("LineEdit").get_text() == ""):
		player_information.player_name = "Unamed"
	else:
		player_information.player_name = get_parent().get_node("LineEdit").get_text()
	numberPlayer.number_player = get_parent().get_node("OptionButton").get_selected_ID()
	get_tree().change_scene("res://Scene/General/game.scn")
