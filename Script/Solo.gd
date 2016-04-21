
extends TextureButton

func _on_SoloButton_pressed():
	if (number_player.nb_player == 2) && (get_parent().get_node("Ready1").is_disabled()):
		get_game()
	if (number_player.nb_player == 3) && (get_parent().get_node("Ready2").is_disabled()):
		get_game()
	if (number_player.nb_player == 4) && (get_parent().get_node("Ready3").is_disabled()):
		get_game()
	if (number_player.nb_player == 5) && (get_parent().get_node("Ready4").is_disabled()):
		get_game()

func get_game():
	if (get_parent().get_node("LineEdit").get_text() == "Enter your name") || (get_parent().get_node("LineEdit").get_text() == ""):
		player_information.player_name = "Unamed"
	else:
		player_information.player_name = get_parent().get_node("LineEdit").get_text()
	number_player.nb_player = get_parent().get_node("OptionButton").get_selected_ID()
	
	if (get_parent().get_node("LineEdit 2").get_text() == "Enter your name") || (get_parent().get_node("LineEdit 2").get_text() == ""):
		player_information.player_2_name = "Unamed"
	else:
		player_information.player_2_name = get_parent().get_node("LineEdit 2").get_text()
	
	if (get_parent().get_node("LineEdit 3").get_text() == "Enter your name") || (get_parent().get_node("LineEdit 3").get_text() == ""):
		player_information.player_3_name = "Unamed"
	else:
		player_information.player_3_name = get_parent().get_node("LineEdit 3").get_text()
	
	if (get_parent().get_node("LineEdit 4").get_text() == "Enter your name") || (get_parent().get_node("LineEdit 4").get_text() == ""):
		player_information.player_4_name = "Unamed"
	else:
		player_information.player_4_name = get_parent().get_node("LineEdit 4").get_text()
	
	if (get_parent().get_node("LineEdit 5").get_text() == "Enter your name") || (get_parent().get_node("LineEdit 5").get_text() == ""):
		player_information.player_5_name = "Unamed"
	else:
		player_information.player_5_name = get_parent().get_node("LineEdit 5").get_text()
	
	get_tree().change_scene("res://Scene/General/game.scn")