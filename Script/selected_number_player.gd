
extends OptionButton

func _ready():
	add_item("2 players", 2)
	add_item("3 players", 3)
	add_item("4 players", 4)
	add_item("5 players", 5)


func _on_OptionButton_item_selected( ID ):
	if ID == 1:
		number_player.nb_player = 3
	elif ID == 2:
		number_player.nb_player = 4
	elif ID == 3:
		number_player.nb_player = 5