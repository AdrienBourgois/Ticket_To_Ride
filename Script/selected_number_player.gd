
extends OptionButton

func _ready():
	add_item("2 players", 2)
	add_item("3 players", 3)
	add_item("4 players", 4)
	add_item("5 players", 5)
	get_parent().get_node("LineEdit 3").hide()
	get_parent().get_node("LineEdit 4").hide()
	get_parent().get_node("LineEdit 5").hide()
	get_parent().get_node("TextureButton 2").hide()
	get_parent().get_node("TextureButton 3").hide()
	get_parent().get_node("TextureButton 4").hide()


func _on_OptionButton_item_selected( ID ):
	print(ID)
	if ID == 0:
		get_parent().get_node("LineEdit 3").hide()
		get_parent().get_node("LineEdit 4").hide()
		get_parent().get_node("LineEdit 5").hide()
		get_parent().get_node("TextureButton 2").hide()
		get_parent().get_node("TextureButton 3").hide()
		get_parent().get_node("TextureButton 4").hide()
	elif ID == 1:
		get_parent().get_node("LineEdit 3").show()
		get_parent().get_node("TextureButton 2").show()
		get_parent().get_node("TextureButton 3").hide()
		get_parent().get_node("TextureButton 4").hide()
		get_parent().get_node("LineEdit 4").hide()
		get_parent().get_node("LineEdit 5").hide()
	elif ID == 2:
		get_parent().get_node("LineEdit 3").show()
		get_parent().get_node("LineEdit 4").show()
		get_parent().get_node("TextureButton 2").show()
		get_parent().get_node("TextureButton 3").show()
		get_parent().get_node("LineEdit 5").hide()
		get_parent().get_node("TextureButton 4").hide()
	elif ID == 3:
		get_parent().get_node("TextureButton 2").show()
		get_parent().get_node("TextureButton 3").show()
		get_parent().get_node("TextureButton 4").show()
		get_parent().get_node("LineEdit 3").show()
		get_parent().get_node("LineEdit 4").show()
		get_parent().get_node("LineEdit 5").show()
