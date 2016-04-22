
extends Node

var wagon_cards = []
var road_cards = []
var count_pink = []
var count_white = []
var count_blue = []
var count_yellow = []
var count_orange = []
var count_black = []
var count_red = []
var count_green = []
var count_locomotive = []
var count_card = 0

func _ready():
	translate(Vector3(0.0, 0.0, 40.0))

func add_card(card):
	var translate_pink_card = get_translation() + Vector3(5,0,0)
	var translate_white_card = get_translation() + Vector3(10,0,0)
	var translate_blue_card = get_translation() + Vector3(15,0,0)
	var translate_yellow_card = get_translation() + Vector3(20,0,0)
	var translate_orange_card = get_translation() + Vector3(0,0,0)
	var translate_black_card = get_translation() + Vector3(-5,0,0)
	var translate_red_card = get_translation() + Vector3(-10,0,0)
	var translate_green_card = get_translation() + Vector3(-15,0,0)
	var translate_locomotive_card = get_translation() + Vector3(-20,0,0)
	
	add_child(card)
	count_card += 1
	if count_card == 2:
		count_card = 0
		get_node("/root/Game").set_change()
	
	if card.location == "deck_wagon_top":
		card.go_to(0, get_rotation() + Vector3(180, 90, 0))
		if (card.parameters["id"] >= 97) && (card.parameters["id"] <= 110):
			count_locomotive.append(card)
			get_node("Plate/Locomotive").set_pos(Vector2(self.get_translation().x + 360, 580))
			get_node("Plate/Locomotive").set_text(str(count_locomotive.size()))
			card.go_to(translate_locomotive_card, get_rotation() + Vector3(180,90,0))
	elif (card.parameters["id"] >= 97) && (card.parameters["id"] <= 110):
		count_locomotive.append(card)
		get_node("Plate/Locomotive").set_pos(Vector2(self.get_translation().x + 360, 580))
		get_node("Plate/Locomotive").set_text(str(count_locomotive.size()))
		card.go_to(translate_locomotive_card, get_rotation() + Vector3(180,90,0))
		get_node("/root/Game").set_change()
		count_card = 0
	if (card.parameters["id"] >= 1) && (card.parameters["id"] <= 12):
		count_pink.append(card)
		get_node("Plate/Pink").set_pos(Vector2(self.get_translation().x + 550, 580))
		get_node("Plate/Pink").set_text(str(count_pink.size()))
		card.go_to(translate_pink_card, get_rotation() + Vector3(180,90,0))
	if (card.parameters["id"] >= 13) && (card.parameters["id"] <= 24):
		count_white.append(card)
		get_node("Plate/White").set_pos(Vector2(self.get_translation().x + 585, 580))
		get_node("Plate/White").set_text(str(count_white.size()))
		card.go_to(translate_white_card, get_rotation() + Vector3(180,90,0))
	if (card.parameters["id"] >= 25) && (card.parameters["id"] <= 36):
		count_blue.append(card)
		get_node("Plate/Blue").set_pos(Vector2(self.get_translation().x + 620, 580))
		get_node("Plate/Blue").set_text(str(count_blue.size()))
		card.go_to(translate_blue_card, get_rotation() + Vector3(180,90,0))
	if (card.parameters["id"] >= 37) && (card.parameters["id"] <= 48):
		count_yellow.append(card)
		get_node("Plate/Yellow").set_pos(Vector2(self.get_translation().x + 655, 580))
		get_node("Plate/Yellow").set_text(str(count_yellow.size()))
		card.go_to(translate_yellow_card, get_rotation() + Vector3(180,90,0))
	if (card.parameters["id"] >= 49) && (card.parameters["id"] <= 60):
		count_orange.append(card)
		get_node("Plate/Orange").set_pos(Vector2(self.get_translation().x + 510, 580))
		get_node("Plate/Orange").set_text(str(count_orange.size()))
		card.go_to(translate_orange_card, get_rotation() + Vector3(180,90,0))
	if (card.parameters["id"] >= 61) && (card.parameters["id"] <= 72):
		count_black.append(card)
		get_node("Plate/Black").set_pos(Vector2(self.get_translation().x + 475, 580))
		get_node("Plate/Black").set_text(str(count_black.size()))
		card.go_to(translate_black_card, get_rotation() + Vector3(180,90,0))
	if (card.parameters["id"] >= 73) && (card.parameters["id"] <= 84):
		count_red.append(card)
		get_node("Plate/Red").set_pos(Vector2(self.get_translation().x + 440, 580))
		get_node("Plate/Red").set_text(str(count_red.size()))
		card.go_to(translate_red_card, get_rotation() + Vector3(180,90,0))
	if (card.parameters["id"] >= 85) && (card.parameters["id"] <= 96):
		count_green.append(card)
		get_node("Plate/Green").set_pos(Vector2(self.get_translation().x + 400, 580))
		get_node("Plate/Green").set_text(str(count_green.size()))
		card.go_to(translate_green_card, get_rotation() + Vector3(180,90,0))
	

