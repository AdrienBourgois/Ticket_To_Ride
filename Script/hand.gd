
extends Node

var wagon_cards = []
var road_cards = []
var count_card = {"pink": 0, "white": 0, "blue": 0, "yellow": 0, "orange": 0, "black": 0, "red": 0, "green": 0, "locomotive": 0}
var cards_taken_on_turn = 0

func _ready():
	translate(Vector3(0.0, 0.0, 40.0))

func add_card(card):
	var translate = {"pink": Vector3(5,0,0), "white": Vector3(10,0,0), "blue": Vector3(15,0,0), "yellow": Vector3(20,0,0), "orange": Vector3(0,0,0), "black": Vector3(-5,0,0), "red": Vector3(-10,0,0), "green": Vector3(-15,0,0), "locomotive": Vector3(-20,0,0)}
	
	add_child(card)
	cards_taken_on_turn += 1
	if cards_taken_on_turn == 2:
		cards_taken_on_turn = 0
		get_node("/root/Game").set_change()
	
	if (card.parameters["type"] == "wagon"):
		if (card.parameters["sub-type"] == "color"):
			var color = card.parameters["color"]
			count_card[color] = count_card[color] + 1
			wagon_cards.append(card)
			get_node("Plate/" + color).set_pos(Vector2(self.get_translation().x + (510 + translate[color].x * 7) , 580))
			get_node("Plate/" + color).set_text(str(count_card[color]))
			card.go_to(get_translation() + translate[color], get_rotation() + Vector3(180,90,0))
		elif (card.parameters["sub-type"] == "locomotive"):
			var color = "locomotive"
			count_card[color] = count_card[color] + 1
			wagon_cards.append(card)
			get_node("Plate/" + color).set_pos(Vector2(self.get_translation().x + 370 , 580))
			get_node("Plate/" + color).set_text(str(count_card[color]))
			card.go_to(get_translation() + translate[color], get_rotation() + Vector3(180,90,0))
			get_node("/root/Game").set_change()
			cards_taken_on_turn = 0

