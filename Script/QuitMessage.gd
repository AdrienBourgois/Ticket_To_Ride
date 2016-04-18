extends ConfirmationDialog

func _ready():
	pass

func _on_ConfirmationQuit_confirmed():
	get_tree().change_scene("res://Scene/General/main_menu.scn")