extends OptionButton


func _ready():
	add_item("Choose Color")
	add_item("Green")
	add_item("Blue")
	add_item("Yellow")
	add_item("Red")
	add_item("Purple")

func _on_OptionColor_item_selected( ID ):
	if ID == 1:
		player_information.player_color = colors.green
	elif ID == 2:
		player_information.player_color = colors.blue
	elif ID == 3:
		player_information.player_color = colors.yellow
	elif ID == 4:
		player_information.player_color = colors.red
	elif ID == 5:
		player_information.player_color = colors.purple

func _on_OptionColor1_item_selected( ID ):
	if ID == 1:
		player_information.player_2_color = colors.green
	elif ID == 2:
		player_information.player_2_color = colors.blue
	elif ID == 3:
		player_information.player_2_color = colors.yellow
	elif ID == 4:
		player_information.player_2_color = colors.red
	elif ID == 5:
		player_information.player_2_color = colors.purple

func _on_OptionColor2_item_selected( ID ):
	if ID == 1:
		player_information.player_3_color = colors.green
	elif ID == 2:
		player_information.player_3_color = colors.blue
	elif ID == 3:
		player_information.player_3_color = colors.yellow
	elif ID == 4:
		player_information.player_3_color = colors.red
	elif ID == 5:
		player_information.player_3_color = colors.purple

func _on_OptionColor3_item_selected( ID ):
	if ID == 1:
		player_information.player_4_color = colors.green
	elif ID == 2:
		player_information.player_4_color = colors.blue
	elif ID == 3:
		player_information.player_4_color = colors.yellow
	elif ID == 4:
		player_information.player_4_color = colors.red
	elif ID == 5:
		player_information.player_4_color = colors.purple

func _on_OptionColor4_item_selected( ID ):
	if ID == 1:
		player_information.player_5_color = colors.green
	elif ID == 2:
		player_information.player_5_color = colors.blue
	elif ID == 3:
		player_information.player_5_color = colors.yellow
	elif ID == 4:
		player_information.player_5_color = colors.red
	elif ID == 5:
		player_information.player_5_color = colors.purple