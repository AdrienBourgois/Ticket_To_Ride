extends Button

func _ready():
	pass

func _pressed():
	get_parent().get_node("Panel").show()
	get_parent().get_node("Panel/ConfirmationQuit").show()

func _on_ConfirmationQuit_hide():
	get_parent().get_node("Panel").hide()
