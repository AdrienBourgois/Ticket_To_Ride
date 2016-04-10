
extends Node

var deck = []
var id = 1
var Card_class = load("res://Script/card.gd")

var wagon_pink   = { "type": "wagon", "color": "pink" }
var wagon_white  = { "type": "wagon", "color": "white" }
var wagon_blue   = { "type": "wagon", "color": "blue" }
var wagon_yellow = { "type": "wagon", "color": "yellow" }
var wagon_orange = { "type": "wagon", "color": "orange" }
var wagon_black  = { "type": "wagon", "color": "black" }
var wagon_red    = { "type": "wagon", "color": "red" }
var wagon_green  = { "type": "wagon", "color": "green" }
var locomotive   = { "type": "wagon", "color": "locomotive" }
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
	#for card in deck:
	#	print(card)
	
	var card = Card_class.new(deck[0])
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
	
