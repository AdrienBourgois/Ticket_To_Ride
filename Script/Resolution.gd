
extends OptionButton

func _ready():
	add_item("fullscreen", 0)
	add_item("1440 * 800", 1)
	add_item("800*600", 2)
	set_process(true)
	pass

func _process(delta):
	if get_selected() == 0 && get_parent().get_node("Apply").is_pressed():
		OS.set_window_fullscreen(true)
	elif get_selected() == 1 && get_parent().get_node("Apply").is_pressed():
		OS.set_window_fullscreen(false)
		OS.set_window_size(Vector2(1400, 800))
	elif get_selected() == 2 && get_parent().get_node("Apply").is_pressed():
		OS.set_window_fullscreen(false)
		OS.set_window_size(Vector2(800, 600))
	pass
