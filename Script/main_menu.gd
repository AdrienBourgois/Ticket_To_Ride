
extends VBoxContainer

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass




func _on_Play_pressed():
	pass # replace with function body


func _on_Plus_pressed():
	pass # replace with function body


func _on_Quit_pressed():
	get_node("Quit/ConfirmationToQuit").show()
	pass # replace with function body


func _on_ConfirmationToQuit_confirmed():
	get_tree().quit()
	pass # replace with function body
