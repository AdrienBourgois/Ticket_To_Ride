
extends Label
onready var pos_start_y = get_pos().y
export var speed_defile = 2.0
var count = 0

func _ready():
	set_text("Credits:")
	set_process(true)
	pass

func _process(delta):

	set_pos(Vector2(get_pos().x, get_pos().y - speed_defile))
	if get_pos().y <= get_parent().get_node("Panel").get_pos().y:
		count += 1
		set_text("Game Developpers: \n\n\n DE FIGUEIREDO Anthony \n EL KHOURY Paul \n KLEINE Alexis \n BOURGOIS Adrien")
		set_pos(Vector2(get_pos().x, pos_start_y))
		if count == 2:
			set_opacity(0.0)
