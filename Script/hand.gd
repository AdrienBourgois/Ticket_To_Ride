
extends Spatial

var wagon_cards = []
var road_cards = []
var count_card = {"pink": 0, "white": 0, "blue": 0, "yellow": 0, "orange": 0, "black": 0, "red": 0, "green": 0, "locomotive": 0}
var cards_took_on_turn = 0

func _ready():
	translate(Vector3(0.0, 0.0, 40.0))

func add_card(card):
	var translate = {"pink": Vector3(5,0,0), "white": Vector3(10,0,0), "blue": Vector3(15,0,0), "yellow": Vector3(20,0,0), "orange": Vector3(0,0,0), "black": Vector3(-5,0,0), "red": Vector3(-10,0,0), "green": Vector3(-15,0,0), "locomotive": Vector3(-20,0,0)}
	
	add_child(card)
	cards_took_on_turn += 1
	if cards_took_on_turn == 2:
		cards_took_on_turn = 0
		get_node("/root/Game").set_change()
	
	if (card.parameters["type"] == "wagon"):
		if (card.parameters["sub-type"] == "color"):
			var color = card.parameters["color"]
			count_card[color] = count_card[color] + 1
			wagon_cards.append(card)
			get_node(color).set_anchor(MARGIN_LEFT, Control.ANCHOR_RATIO)
			get_node(color).set_anchor(MARGIN_BOTTOM, Control.ANCHOR_RATIO)
			get_node(color).set_anchor(MARGIN_RIGHT, Control.ANCHOR_RATIO)
			get_node(color).set_anchor(MARGIN_TOP, Control.ANCHOR_RATIO)
			get_node(color).set_margin(MARGIN_LEFT, 0)
			get_node(color).set_margin(MARGIN_BOTTOM, 0)
			get_node(color).set_margin(MARGIN_RIGHT, 0)
			get_node(color).set_margin(MARGIN_TOP, 0)
			get_node(color).set_pos(Vector2(self.get_translation().x + (510 + translate[color].x * 7) , 580))
			get_node(color).set_text(str(count_card[color]))
			card.go_to(get_translation() + translate[color], get_rotation() + Vector3(180,90,0))
		elif (card.parameters["sub-type"] == "locomotive"):
			var color = "locomotive"
			count_card[color] = count_card[color] + 1
			wagon_cards.append(card)
			get_node(color).set_pos(Vector2(self.get_translation().x + 370 , 580))
			get_node(color).set_text(str(count_card[color]))
			card.go_to(get_translation() + translate[color], get_rotation() + Vector3(180,90,0))
			if (card.location == "card_location"):
				get_node("/root/Game").set_change()
				cards_took_on_turn = 0
	
	card.location = "hand"
	card.disable_connect()

func request_card(color, count):
	if (count_card[color] >= count):
		return true
	else:
		return false

func remove_card(color, count):
	count_card[color] -= count
	
	var cur_card = 0
	while(count):
		if (wagon_cards[cur_card].parameters["sub-type"] == "locomotive"):
			if (color == "locomotive"):
				count -= 1
				remove_child(wagon_cards[cur_card])
				get_node("/root/Game/Discard_pile").add_card(wagon_cards[cur_card])
				wagon_cards.remove(cur_card)
		
		elif (wagon_cards[cur_card].parameters["color"] == color):
			count -= 1
			remove_child(wagon_cards[cur_card])
			get_node("/root/Game/Discard_pile").add_card(wagon_cards[cur_card])
			wagon_cards.remove(cur_card)
		cur_card += 1
	
	count_card[color] -= count
	get_node(color).set_text(str(count_card[color]))

func hide_hand():
	get_node("pink").hide()
	get_node("white").hide()
	get_node("blue").hide()
	get_node("yellow").hide()
	get_node("orange").hide()
	get_node("black").hide()
	get_node("red").hide()
	get_node("green").hide()
	get_node("locomotive").hide()
	for card in wagon_cards:
		card.get_node("StaticBody/Recto").hide()
		card.get_node("StaticBody/Verso").hide()

func show_hand():
	get_node("pink").show()
	get_node("white").show()
	get_node("blue").show()
	get_node("yellow").show()
	get_node("orange").show()
	get_node("black").show()
	get_node("red").show()
	get_node("green").show()
	get_node("locomotive").show()
	for card in wagon_cards:
		card.get_node("StaticBody/Recto").show()
		card.get_node("StaticBody/Verso").show()
