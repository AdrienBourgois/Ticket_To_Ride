
extends LineEdit

func _ready():
	set_text("Enter your name")

func _on_NamePlayerClient_input_event( ev ):
	if Input.is_mouse_button_pressed(1) && get_text() == "Enter your name":
		set_text("")

func _on_NamePlayerHost_input_event( ev ):
	if Input.is_mouse_button_pressed(1) && get_text() == "Enter your name":
		set_text("")

func _on_LineEdit_input_event( ev ):
	if Input.is_mouse_button_pressed(1) && get_text() == "Enter your name":
		set_text("")


func _on_LineEdit_2_input_event( ev ):
	if Input.is_mouse_button_pressed(1) && get_text() == "Enter your name":
		set_text("")


func _on_LineEdit_3_input_event( ev ):
	if Input.is_mouse_button_pressed(1) && get_text() == "Enter your name":
		set_text("")


func _on_LineEdit_4_input_event( ev ):
	if Input.is_mouse_button_pressed(1) && get_text() == "Enter your name":
		set_text("")


func _on_LineEdit_5_input_event( ev ):
	if Input.is_mouse_button_pressed(1) && get_text() == "Enter your name":
		set_text("")
