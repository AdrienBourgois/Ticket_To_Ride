
extends TextureButton

func _on_SoloButton_pressed():
	player_information.player_name = get_parent().get_node("LineEdit").get_text()
	get_tree().change_scene("res://Scene/General/game.scn")
