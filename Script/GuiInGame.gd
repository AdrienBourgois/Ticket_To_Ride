extends Control

func _ready():
	set_player_name()
	set_process_input(true)

func _input(event):
	if Input.is_key_pressed(KEY_ESCAPE):
		print(get_node("pauseMenu").get_children())
		get_node("pauseMenu").show()

func set_player_name():
	var t = Theme.new()
	t.set_color("font_color", "Label", player_information.player_color)
	if player_information.player_name == null:
		get_node("PanelPlayer/player").set_text("Player 1")
	else:
		get_node("PanelPlayer/player").set_text(player_information.player_name)
	get_node("PanelPlayer/player").set_theme(t)

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