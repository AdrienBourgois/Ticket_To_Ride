
extends Node

var deck = []
var id = 1
var Card_scene = preload("res://Scene/card.scn")

var wagon_pink   = { "type": "wagon", "sub-type": "color", "color-code": colors.pink,   "color": "pink" }
var wagon_white  = { "type": "wagon", "sub-type": "color", "color-code": colors.white,  "color": "white"}
var wagon_blue   = { "type": "wagon", "sub-type": "color", "color-code": colors.blue,   "color": "blue" }
var wagon_yellow = { "type": "wagon", "sub-type": "color", "color-code": colors.yellow, "color": "yellow" }
var wagon_orange = { "type": "wagon", "sub-type": "color", "color-code": colors.orange, "color": "orange" }
var wagon_black  = { "type": "wagon", "sub-type": "color", "color-code": colors.black,  "color": "black" }
var wagon_red    = { "type": "wagon", "sub-type": "color", "color-code": colors.red,    "color": "red" }
var wagon_green  = { "type": "wagon", "sub-type": "color", "color-code": colors.green,  "color": "green" }
var locomotive   = { "type": "wagon", "sub-type": "locomotive" }
var road         = { "type": "road" }

func add_card(card_type, count):
	var card = str2var(var2str(card_type))
	
	for i in range(count):
		card["id"] = id
		deck.append(card)
		id += 1

func create_road_card():
	pass

func create_deck():
	add_card(wagon_pink, 12)
	add_card(wagon_white, 12)
	add_card(wagon_blue, 12)
	add_card(wagon_yellow, 12)
	add_card(wagon_orange, 12)
	add_card(wagon_black, 12)
	add_card(wagon_red, 12)
	add_card(wagon_green, 12)
	add_card(locomotive, 14)

func _ready():
	create_deck()
	mix_deck()
	for card in deck:
		print(card)
	
	for i in range(deck.size()):
		var card = Card_scene.instance()
		card.prepare_card(deck[i], i)
		add_child(card)

func mix_deck():
	var size = deck.size()
	var cur_card = 0
	var mixed_deck = []
	
	for i in range(size):
		randomize()
		cur_card = randi() % deck.size()
		mixed_deck.append(deck[cur_card])
		deck.erase(deck[cur_card])
	
	deck = mixed_deck
