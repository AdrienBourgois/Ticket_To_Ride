extends Spatial
var board_scn = preload("res://Scene/board.scn")

func _ready():
	add_child(board_scn.instance())