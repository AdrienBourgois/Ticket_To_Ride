extends Button

func _ready():
	pass

func _pressed():
	get_parent().get_node("quit/Panel").show()
	get_parent().get_node("quit/Panel/ConfirmationQuit").show()

func _on_ConfirmationQuit_hide():
	get_parent().get_node("quit/Panel").hide()
