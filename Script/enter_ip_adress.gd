
extends LineEdit

signal Clicked()

func _ready():
	set_text("Enter IP Adress of the server...")

func _on_IP_input_event( ev ):
	if Input.is_mouse_button_pressed(1) && get_text() == "Enter IP Adress of the server...":
		set_text("")