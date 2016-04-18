extends Control

func _ready():
	set_process_input(true)

func _input(event):
	if Input.is_key_pressed(KEY_ESCAPE):
		print(get_node("pauseMenu").get_children())
		get_node("pauseMenu").show()