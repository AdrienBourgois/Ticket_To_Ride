
extends Control

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_node("Connect/ConnectButton").connect("pressed", self, "_on_ConnectButton_pressed")
	get_node("Host/HostButton").connect("pressed", self, "_on_HostButton_pressed")
	pass

func _on_HostButton_pressed():
	var newScene = load("res://Scene/server.scn").instance()
	self.hide()
	add_child(newScene)
	pass

func _on_ConnectButton_pressed():
	var newScene = load("res://Scene/client.scn").instance()
	self.hide()
	newScene.ip = get_node("Connect/EnterIP").get_text()
	add_child(newScene)
	pass


func _on_Button_pressed():
	get_tree().change_scene("res://Scene/choose_mode_menu.scn")
	pass # replace with function body
