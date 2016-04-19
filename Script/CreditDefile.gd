
extends Label
onready var pos_start_y = get_pos().y
var speed_defile = 0.03

func _ready():
	set_text("Credits: \n\n Game Developpers: \n\n\n DE FIGUEIREDO Anthony \n EL KHOURY Paul \n KLEINE Alexis \n BOURGOIS Adrien")
	set_fixed_process(true)

func _fixed_process(delta):
	print(get_pos())
	set_pos(Vector2(get_pos().x, get_pos().y - (speed_defile * delta)))
	if get_pos().y <= get_parent().get_pos().y:
		set_pos(Vector2(get_pos().x, pos_start_y))
