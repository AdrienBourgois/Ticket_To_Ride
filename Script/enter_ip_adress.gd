
extends LineEdit

func _ready():
	set_text("Enter IP Adress of the server...")
	pass

func _on_IP_input_event( ev ):
	if get_text() == "Enter IP Adress of the server...":
		set_text("")
	pass # replace with function body
