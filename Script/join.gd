
extends Button

func _on_Join_pressed():
	get_tree().change_scene("res://Scene/Object/client.scn")
	player_information.ip = get_parent().get_node("IP").get_text()


func _on_OK_pressed():
	player_information.player_name = get_parent().get_node("NamePlayerClient").get_text()
