extends Control

func _ready():

	if (mode.server == true) || (mode.client == true):
		get_node("PanelChat").set_opacity(1.0)
		if mode.server == true:
			set_color_serverside()
			set_serverside_player_name()
		else:
			set_clientside_player_name()
	else:
		get_node("PanelChat").set_opacity(0.0)
		set_gui_to_player()
		set_player_name()
	set_process_input(true)

func _input(event):
	if Input.is_key_pressed(KEY_ESCAPE):
		print(get_node("pauseMenu").get_children())
		get_node("pauseMenu").show()

func set_color_serverside():
	var t = Theme.new()
	t.set_color("font_color", "Label", player_information.player_color)

func set_player_name():
	var t = Theme.new()
	var t2 = Theme.new()
	var t3 = Theme.new()
	var t4 = Theme.new()
	var t5 = Theme.new()
	if number_player.nb_player != null:
		if (number_player.nb_player <= 5) && (number_player.nb_player >= 2):
			if number_player.nb_player >= 2:
				t.set_color("font_color", "Label", player_information.player_color)
				get_node("PanelPlayer/player").set_text(player_information.player_name)
				get_node("PanelPlayer/player").set_theme(t)
				t2.set_color("font_color", "Label", player_information.player_2_color)
				get_node("PanelPlayer1/player").set_text(player_information.player_2_name)
				get_node("PanelPlayer1/player").set_theme(t2)
				if number_player.nb_player >= 3:
					t3.set_color("font_color", "Label", player_information.player_3_color)
					get_node("PanelPlayer2/player").set_text(player_information.player_3_name)
					get_node("PanelPlayer2/player").set_theme(t3)
					if number_player.nb_player >= 4:
						t4.set_color("font_color", "Label", player_information.player_4_color)
						get_node("PanelPlayer3/player").set_text(player_information.player_4_name)
						get_node("PanelPlayer3/player").set_theme(t4)
						if number_player.nb_player >= 5:
							t5.set_color("font_color", "Label", player_information.player_5_color)
							get_node("PanelPlayer4/player").set_text(player_information.player_5_name)
							get_node("PanelPlayer4/player").set_theme(t5)

func set_clientside_player_name():
	var t = Theme.new()
	t.set_color("font_color", "Label", player_information.player_color)
	get_node("PanelPlayer/player").set_text(player_information.player_name)
	get_node("PanelPlayer/player").set_theme(t)

func set_serverside_player_name():
	var t = Theme.new()
	if get_parent().get_child(0).get_player_number() == 0:
		t.set_color("font_color", "Label", player_information.player_color)
		get_node("PanelPlayer/player").set_text(player_information.player_name)
		get_node("PanelPlayer/player").set_theme(t)
	elif get_parent().get_child(0).get_player_number() == 1:
		t.set_color("font_color", "Label", player_information.player_color)
		get_node("PanelPlayer1/player").set_text(player_information.player_name)
		get_node("PanelPlayer1/player").set_theme(t)
	elif get_parent().get_child(0).get_player_number() == 2:
		t.set_color("font_color", "Label", player_information.player_color)
		get_node("PanelPlayer2/player").set_text(player_information.player_name)
		get_node("PanelPlayer2/player").set_theme(t)
	elif get_parent().get_child(0).get_player_number() == 3:
		t.set_color("font_color", "Label", player_information.player_color)
		get_node("PanelPlayer3/player").set_text(player_information.player_name)
		get_node("PanelPlayer3/player").set_theme(t)
	elif get_parent().get_child(0).get_player_number() == 4:
		t.set_color("font_color", "Label", player_information.player_color)
		get_node("PanelPlayer4/player").set_text(player_information.player_name)
		get_node("PanelPlayer4/player").set_theme(t)

func set_gui_to_player():
	if number_player.nb_player == 2:
		get_node("PanelPlayer2").hide()
		get_node("PanelPlayer3").hide()
		get_node("PanelPlayer4").hide()
	if  number_player.nb_player == 3:
		get_node("PanelPlayer3").hide()
		get_node("PanelPlayer4").hide()
	if number_player.nb_player == 4:
		get_node("PanelPlayer4").hide()

func set_wagon_value(new_value):
	if get_parent().players[0].your_turn == true:
		get_node("PanelPlayer/wagon/value").set_text(str(new_value))
	elif get_parent().players[1].your_turn == true:
		get_node("PanelPlayer1/wagon/value").set_text(str(new_value))
	elif get_parent().players[2].your_turn == true:
		get_node("PanelPlayer2/wagon/value").set_text(str(new_value))
	elif get_parent().players[3].your_turn == true:
		get_node("PanelPlayer3/wagon/value").set_text(str(new_value))
	elif get_parent().players[4].your_turn == true:
		get_node("PanelPlayer4/wagon/value").set_text(str(new_value))

func set_station_value(new_value):
	if get_parent().players[0].your_turn == true:
		get_node("PanelPlayer/train_station/value").set_text(str(new_value))
	elif get_parent().players[1].your_turn == true:
		get_node("PanelPlayer1/train_station/value").set_text(str(new_value))
	elif get_parent().players[2].your_turn == true:
		get_node("PanelPlayer2/train_station/value").set_text(str(new_value))
	elif get_parent().players[3].your_turn == true:
		get_node("PanelPlayer3/train_station/value").set_text(str(new_value))
	elif get_parent().players[4].your_turn == true:
		get_node("PanelPlayer4/train_station/value").set_text(str(new_value))

func hide_other():
	if get_parent().players[0].your_turn == true:
		get_node("PanelPlayer1/TextureFrame").hide()
		get_node("PanelPlayer2/TextureFrame").hide()
		get_node("PanelPlayer3/TextureFrame").hide()
		get_node("PanelPlayer4/TextureFrame").hide()
	elif get_parent().players[1].your_turn == true:
		get_node("PanelPlayer/TextureFrame").hide()
		get_node("PanelPlayer2/TextureFrame").hide()
		get_node("PanelPlayer3/TextureFrame").hide()
		get_node("PanelPlayer4/TextureFrame").hide()
	elif get_parent().players[2].your_turn == true:
		get_node("PanelPlayer/TextureFrame").hide()
		get_node("PanelPlayer1/TextureFrame").hide()
		get_node("PanelPlayer3/TextureFrame").hide()
		get_node("PanelPlayer4/TextureFrame").hide()
	elif get_parent().players[3].your_turn == true:
		get_node("PanelPlayer/TextureFrame").hide()
		get_node("PanelPlayer1/TextureFrame").hide()
		get_node("PanelPlayer2/TextureFrame").hide()
		get_node("PanelPlayer4/TextureFrame").hide()
	elif get_parent().players[4].your_turn == true:
		get_node("PanelPlayer/TextureFrame").hide()
		get_node("PanelPlayer1/TextureFrame").hide()
		get_node("PanelPlayer2/TextureFrame").hide()
		get_node("PanelPlayer3/TextureFrame").hide()

func set_player_turn():
	if get_parent().players[0].your_turn == true:
		hide_other()
		get_node("PanelPlayer/TextureFrame").show()
	elif get_parent().players[1].your_turn == true:
		hide_other()
		get_node("PanelPlayer1/TextureFrame").show()
	elif get_parent().players[2].your_turn == true:
		hide_other()
		get_node("PanelPlayer2/TextureFrame").show()
	elif get_parent().players[3].your_turn == true:
		hide_other()
		get_node("PanelPlayer3/TextureFrame").show()
	elif get_parent().players[4].your_turn == true:
		hide_other()
		get_node("PanelPlayer4/TextureFrame").show()

func set_score_value(new_value):
	if get_parent().players[0].your_turn == true:
		get_node("PanelPlayer/score/value").set_text(str(new_value))
		score_manager.score_player1 = new_value
	elif get_parent().players[1].your_turn == true:
		get_node("PanelPlayer1/score/value").set_text(str(new_value))
		score_manager.score_player2 = new_value
	elif get_parent().players[2].your_turn == true:
		get_node("PanelPlayer2/score/value").set_text(str(new_value))
		score_manager.score_player3 = new_value
	elif get_parent().players[3].your_turn == true:
		get_node("PanelPlayer3/score/value").set_text(str(new_value))
		score_manager.score_player4 = new_value
	elif get_parent().players[4].your_turn == true:
		get_node("PanelPlayer4/score/value").set_text(str(new_value))
		score_manager.score_player5 = new_value

func set_info_cities(name):
	get_node("infoGame/infoCities/name").set_text(str(name))

func set_info_paths(type):
	get_node("infoGame/infoPaths/type").set_text(str(type))