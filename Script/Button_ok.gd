extends Button

func _on_ButtonOK_pressed():
	get_parent().get_node("OptionButton").set_disabled(true)
	get_parent().get_node("LineEdit").show()
	get_parent().get_node("OptionColor").show()
	get_parent().get_node("LineEdit").show()
	get_parent().get_node("Ready").show()