extends Control

func _ready():
	set_gui_to_player()
	set_player_name()
	if (mode.server == true) || (mode.client == true):
		get_node("PanelChat").set_opacity(1.0)
	set_process_input(true)

func _input(event):
	if Input.is_key_pressed(KEY_ESCAPE):
		print(get_node("pauseMenu").get_children())
		get_node("pauseMenu").show()

func set_player_name():
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

func set_wagon_value(new_value): #(new_value, player)
	#if player1
	get_node("PanelPlayer/wagon/value").set_text(str(new_value))
	#if player2
	get_node("PanelPlayer1/wagon/value").set_text(str(new_value))
	#if player3
	get_node("PanelPlayer2/wagon/value").set_text(str(new_value))
	#if player4
	get_node("PanelPlayer3/wagon/value").set_text(str(new_value))
	#if player5
	get_node("PanelPlayer4/wagon/value").set_text(str(new_value))

func set_station_value(new_value): #(new_value, player)
	#if player1
	get_node("PanelPlayer/train_station/value").set_text(str(new_value))
	#if player2
	get_node("PanelPlayer1/train_station/value").set_text(str(new_value))
	#if player3
	get_node("PanelPlayer2/train_station/value").set_text(str(new_value))
	#if player4
	get_node("PanelPlayer3/train_station/value").set_text(str(new_value))
	#if player5
	get_node("PanelPlayer4/train_station/value").set_text(str(new_value))

func set_score_value(new_value): #(new_value, player)
	#if player1
	get_node("PanelPlayer/score/value").set_text(str(new_value))
	#if player2
	get_node("PanelPlayer1/score/value").set_text(str(new_value))
	#if player3
	get_node("PanelPlayer2/score/value").set_text(str(new_value))
	#if player4
	get_node("PanelPlayer3/score/value").set_text(str(new_value))
	#if player5
	get_node("PanelPlayer4/score/value").set_text(str(new_value))

func set_info_cities(name):
	get_node("infoGame/infoCities/name").set_text(str(name))

func set_info_paths(type):
	get_node("infoGame/infoPaths/type").set_text(str(type))