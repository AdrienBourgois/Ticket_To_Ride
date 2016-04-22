extends Button

func _ready():
	pass

func _on_quit_pressed():
	get_parent().get_node("quit/Panel").show()
	get_parent().get_node("quit/Panel/ConfirmationQuit").show()

func _on_ConfirmationQuit_hide():
	get_parent().get_node("quit/Panel").hide()

func _on_QuitEndGame_pressed():
	get_tree().change_scene("res://Scene/General/main_menu.scn")