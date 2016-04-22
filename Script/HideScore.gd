extends Control

func _ready():
	set_process(true)

func _process(delta):
	if number_player.nb_player >= 3:
		get_node("Third").show()
		if number_player.nb_player >= 4:
			get_node("Fourth").show()
			if number_player.nb_player == 5:
				get_node("Fifth").show()