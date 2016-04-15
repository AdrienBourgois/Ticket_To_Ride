
extends OptionButton

func _ready():
	add_item("fullscreen", 0)
	add_item("1280 * 800", 1)
	add_item("1080 * 800", 2)
	add_item("800 * 600", 3)
	set_process(true)

func _process(delta):
	if get_selected() == 0 && get_parent().get_node("Apply").is_pressed():
		OS.set_window_fullscreen(true)
	elif get_selected() == 1 && get_parent().get_node("Apply").is_pressed():
		OS.set_window_fullscreen(false)
		OS.set_window_size(Vector2(1280, 800))
	elif get_selected() == 2 && get_parent().get_node("Apply").is_pressed():
		OS.set_window_fullscreen(false)
		OS.set_window_size(Vector2(1080, 800))
	elif get_selected() == 3 && get_parent().get_node("Apply").is_pressed():
		OS.set_window_fullscreen(false)
		OS.set_window_size(Vector2(800, 600))
