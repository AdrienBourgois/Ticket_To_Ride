extends Button

func _on_Ready_pressed():
	if get_parent().get_node("OptionColor").get_selected() != 0:
		get_parent().get_node("OptionColor").set_item_disabled(get_parent().get_node("OptionColor").get_selected(), true)
		get_parent().get_node("OptionColor").set_disabled(true)
		self.set_disabled(true)
		get_parent().get_node("OptionColor1").set_item_disabled(get_parent().get_node("OptionColor").get_selected(), true)
		get_parent().get_node("OptionColor2").set_item_disabled(get_parent().get_node("OptionColor").get_selected(), true)
		get_parent().get_node("OptionColor3").set_item_disabled(get_parent().get_node("OptionColor").get_selected(), true)
		get_parent().get_node("OptionColor4").set_item_disabled(get_parent().get_node("OptionColor").get_selected(), true)
		get_parent().get_node("LineEdit 2").show()
		get_parent().get_node("OptionColor1").show()
		get_parent().get_node("Ready1").show()

func _on_Ready1_pressed():
	if get_parent().get_node("OptionColor1").get_selected() != 0:
		get_parent().get_node("OptionColor1").set_item_disabled(get_parent().get_node("OptionColor1").get_selected(), true)
		get_parent().get_node("OptionColor1").set_disabled(true)
		self.set_disabled(true)
		get_parent().get_node("OptionColor").set_item_disabled(get_parent().get_node("OptionColor1").get_selected(), true)
		get_parent().get_node("OptionColor2").set_item_disabled(get_parent().get_node("OptionColor1").get_selected(), true)
		get_parent().get_node("OptionColor3").set_item_disabled(get_parent().get_node("OptionColor1").get_selected(), true)
		get_parent().get_node("OptionColor4").set_item_disabled(get_parent().get_node("OptionColor1").get_selected(), true)
		if number_player.nb_player >= 3:
			get_parent().get_node("LineEdit 3").show()
			get_parent().get_node("OptionColor2").show()
			get_parent().get_node("Ready2").show()


func _on_Ready2_pressed():
	if get_parent().get_node("OptionColor2").get_selected() != 0:
		get_parent().get_node("OptionColor2").set_item_disabled(get_parent().get_node("OptionColor2").get_selected(), true)
		get_parent().get_node("OptionColor2").set_disabled(true)
		self.set_disabled(true)
		get_parent().get_node("OptionColor").set_item_disabled(get_parent().get_node("OptionColor2").get_selected(), true)
		get_parent().get_node("OptionColor1").set_item_disabled(get_parent().get_node("OptionColor2").get_selected(), true)
		get_parent().get_node("OptionColor3").set_item_disabled(get_parent().get_node("OptionColor2").get_selected(), true)
		get_parent().get_node("OptionColor4").set_item_disabled(get_parent().get_node("OptionColor2").get_selected(), true)
		if number_player.nb_player >= 4:
			get_parent().get_node("LineEdit 4").show()
			get_parent().get_node("OptionColor3").show()
			get_parent().get_node("Ready3").show()


func _on_Ready3_pressed():
	if get_parent().get_node("OptionColor3").get_selected() != 0:
		get_parent().get_node("OptionColor3").set_item_disabled(get_parent().get_node("OptionColor3").get_selected(), true)
		get_parent().get_node("OptionColor3").set_disabled(true)
		self.set_disabled(true)
		get_parent().get_node("OptionColor").set_item_disabled(get_parent().get_node("OptionColor3").get_selected(), true)
		get_parent().get_node("OptionColor1").set_item_disabled(get_parent().get_node("OptionColor3").get_selected(), true)
		get_parent().get_node("OptionColor2").set_item_disabled(get_parent().get_node("OptionColor3").get_selected(), true)
		get_parent().get_node("OptionColor4").set_item_disabled(get_parent().get_node("OptionColor3").get_selected(), true)
		if number_player.nb_player == 5:
			get_parent().get_node("LineEdit 5").show()
			get_parent().get_node("OptionColor4").show()
			get_parent().get_node("Ready4").show()


func _on_Ready4_pressed():
	if get_parent().get_node("OptionColor4").get_selected() != 0:
		get_parent().get_node("OptionColor4").set_item_disabled(get_parent().get_node("OptionColor4").get_selected(), true)
		get_parent().get_node("OptionColor4").set_disabled(true)
		self.set_disabled(true)
		get_parent().get_node("OptionColor").set_item_disabled(get_parent().get_node("OptionColor4").get_selected(), true)
		get_parent().get_node("OptionColor1").set_item_disabled(get_parent().get_node("OptionColor4").get_selected(), true)
		get_parent().get_node("OptionColor2").set_item_disabled(get_parent().get_node("OptionColor4").get_selected(), true)
		get_parent().get_node("OptionColor3").set_item_disabled(get_parent().get_node("OptionColor4").get_selected(), true)