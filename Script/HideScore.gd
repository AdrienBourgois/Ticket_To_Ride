extends Control

func _ready():
	set_process(true)
	set_score()
	set_name_to_gui()
	set_win_game()

func _process(delta):
	if number_player.nb_player >= 3:
		get_node("Player3").show()
		if number_player.nb_player >= 4:
			get_node("Player4").show()
			if number_player.nb_player == 5:
				get_node("Player5").show()

func set_name_to_gui():
	var t = Theme.new()
	var t2 = Theme.new()
	var t3 = Theme.new()
	var t4 = Theme.new()
	var t5 = Theme.new()
	
	if number_player.nb_player >= 2:
		t.set_color("font_color", "Label", player_information.player_color)
		get_node("Player1/name").set_text(str(player_information.player_name))
		get_node("Player1/name").set_theme(t)
		t2.set_color("font_color", "Label", player_information.player_2_color)
		get_node("Player2/name").set_text(str(player_information.player_2_name))
		get_node("Player2/name").set_theme(t2)
		if number_player.nb_player >= 3:
			t3.set_color("font_color", "Label", player_information.player_3_color)
			get_node("Player3/name").set_text(str(player_information.player_3_name))
			get_node("Player3/name").set_theme(t3)
			if number_player.nb_player >= 4:
				t4.set_color("font_color", "Label", player_information.player_4_color)
				get_node("Player4/name").set_text(str(player_information.player_4_name))
				get_node("Player4/name").set_theme(t4)
				if number_player.nb_player == 5:
					t5.set_color("font_color", "Label", player_information.player_5_color)
					get_node("Player5/name").set_text(str(player_information.player_5_name))
					get_node("Player5/name").set_theme(t5)

func set_score():
	if number_player.nb_player >= 2:
		get_node("Player2/score/value").set_text(str(score_manager.score_player2))
		get_node("Player1/score/value").set_text(str(score_manager.score_player1))
		if number_player.nb_player >= 3:
			get_node("Player3/score/value").set_text(str(score_manager.score_player3))
			if number_player.nb_player >= 4:
				get_node("Player4/score/value").set_text(str(score_manager.score_player4))
				if number_player.nb_player == 5:
					get_node("Player5/score/value").set_text(str(score_manager.score_player5))

func set_win_game():
	if number_player.nb_player >= 2:
		if score_manager.score_player1 > score_manager.score_player2:
			get_node("Player1/Label").set_text("Winner")
		else:
			get_node("Player1/Label").set_text("Lose")

		if score_manager.score_player2 > score_manager.score_player1:
			get_node("Player2/Label").set_text("Winner")
		else:
			get_node("Player2/Label").set_text("Lose")

		if number_player.nb_player >= 3:
			if (score_manager.score_player3 > score_manager.score_player1) && (score_manager.score_player3 > score_manager.score_player2):
				get_node("Player3/Label").set_text("Winner")
			else:
				get_node("Player3/Label").set_text("Lose")

			if number_player.nb_player >= 4:
				if (score_manager.score_player4 > score_manager.score_player1) && (score_manager.score_player4 > score_manager.score_player2) && (score_manager.score_player4 > score_manager.score_player3):
					get_node("Player4/Label").set_text("Winner")
				else:
					get_node("Player4/Label").set_text("Lose")

				if number_player.nb_player == 5:
					if (score_manager.score_player5 > score_manager.score_player1) && (score_manager.score_player5 > score_manager.score_player2) && (score_manager.score_player5 > score_manager.score_player3) && (score_manager.score_player5 > score_manager.score_player4):
						get_node("Player5/Label").set_text("Winner")
					else:
						get_node("Player5/Label").set_text("Lose")