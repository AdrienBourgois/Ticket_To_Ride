extends Button

func _on_Ready_pressed():
	if get_parent().get_selected() != 0:
		get_parent().set_item_disabled(get_parent().get_selected(), true)
		get_parent().set_disabled(true)
		self.set_disabled(true)
		get_parent().get_parent().get_parent().get_node("LineEdit 2/OptionColor1").set_item_disabled(get_parent().get_selected(), true)
		get_parent().get_parent().get_parent().get_node("LineEdit 3/OptionColor2").set_item_disabled(get_parent().get_selected(), true)
		get_parent().get_parent().get_parent().get_node("LineEdit 4/OptionColor3").set_item_disabled(get_parent().get_selected(), true)
		get_parent().get_parent().get_parent().get_node("LineEdit 5/OptionColor4").set_item_disabled(get_parent().get_selected(), true)
		get_parent().get_parent().get_parent().get_node("LineEdit 2").show()

func _on_Ready1_pressed():
	if get_parent().get_selected() != 0:
		get_parent().set_item_disabled(get_parent().get_selected(), true)
		get_parent().set_disabled(true)
		self.set_disabled(true)
		get_parent().get_parent().get_parent().get_node("LineEdit/OptionColor").set_item_disabled(get_parent().get_selected(), true)
		get_parent().get_parent().get_parent().get_node("LineEdit 3/OptionColor2").set_item_disabled(get_parent().get_selected(), true)
		get_parent().get_parent().get_parent().get_node("LineEdit 4/OptionColor3").set_item_disabled(get_parent().get_selected(), true)
		get_parent().get_parent().get_parent().get_node("LineEdit 5/OptionColor4").set_item_disabled(get_parent().get_selected(), true)
		if number_player.nb_player >= 3:
			get_parent().get_parent().get_parent().get_node("LineEdit 3").show()

func _on_Ready2_pressed():
	if get_parent().get_selected() != 0:
		get_parent().set_item_disabled(get_parent().get_selected(), true)
		get_parent().set_disabled(true)
		self.set_disabled(true)
		get_parent().get_parent().get_parent().get_node("LineEdit/OptionColor").set_item_disabled(get_parent().get_selected(), true)
		get_parent().get_parent().get_parent().get_node("LineEdit 2/OptionColor1").set_item_disabled(get_parent().get_selected(), true)
		get_parent().get_parent().get_parent().get_node("LineEdit 4/OptionColor3").set_item_disabled(get_parent().get_selected(), true)
		get_parent().get_parent().get_parent().get_node("LineEdit 5/OptionColor4").set_item_disabled(get_parent().get_selected(), true)
		if number_player.nb_player >= 4:
			get_parent().get_parent().get_parent().get_node("LineEdit 4").show()

func _on_Ready3_pressed():
	if get_parent().get_selected() != 0:
		get_parent().set_item_disabled(get_parent().get_selected(), true)
		get_parent().set_disabled(true)
		self.set_disabled(true)
		get_parent().get_parent().get_parent().get_node("LineEdit/OptionColor").set_item_disabled(get_parent().get_selected(), true)
		get_parent().get_parent().get_parent().get_node("LineEdit 2/OptionColor1").set_item_disabled(get_parent().get_selected(), true)
		get_parent().get_parent().get_parent().get_node("LineEdit 3/OptionColor2").set_item_disabled(get_parent().get_selected(), true)
		get_parent().get_parent().get_parent().get_node("LineEdit 5/OptionColor4").set_item_disabled(get_parent().get_selected(), true)
		if number_player.nb_player == 5:
			get_parent().get_parent().get_parent().get_node("LineEdit 5").show()

func _on_Ready4_pressed():
	if get_parent().get_selected() != 0:
		get_parent().set_item_disabled(get_parent().get_selected(), true)
		get_parent().set_disabled(true)
		self.set_disabled(true)
		get_parent().get_parent().get_parent().get_node("LineEdit/OptionColor").set_item_disabled(get_parent().get_selected(), true)
		get_parent().get_parent().get_parent().get_node("LineEdit 2/OptionColor1").set_item_disabled(get_parent().get_selected(), true)
		get_parent().get_parent().get_parent().get_node("LineEdit 3/OptionColor2").set_item_disabled(get_parent().get_selected(), true)
		get_parent().get_parent().get_parent().get_node("LineEdit 4/OptionColor3").set_item_disabled(get_parent().get_selected(), true)