
extends Button

func _on_Play_pressed():
	number_player.nb_player = 2
	get_tree().change_scene("res://Scene/General/choose_mode_menu.scn")