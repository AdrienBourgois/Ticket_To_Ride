extends Button

func _on_ButtonOK_pressed():
	get_parent().get_node("OptionButton").set_disabled(true)
	get_parent().get_node("LineEdit").show()