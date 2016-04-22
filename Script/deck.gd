
extends Node

var deck_wagon = []
var deck_road = []
var id = 1
var Card_scene = preload("res://Scene/Object/card.scn")
var cities = null

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
		deck_wagon.append(card)
		id += 1

func create_road_card(count):
	cities = get_node("/root/Game/Board").Cities
	
	var cities_not_used = []
	
	for i in range(count):
		
		if (cities_not_used.size() < 2):
			cities_not_used = str2var(var2str(cities))
		
		randomize()
		var city1 = cities_not_used[randi() % cities_not_used.size()]
		cities_not_used.erase(city1)
		var city2 = cities_not_used[randi() % cities_not_used.size()]
		cities_not_used.erase(city2)
		
		var card = str2var(var2str(road))
		card["city1"] = city1
		card["city2"] = city2
		card["id"] = id
		deck_road.append(card)
		id += 1

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
	create_road_card(40)
	print(deck_wagon)
	print(deck_wagon.size())

func _ready():
	get_node("Deck_Wagon").set_transform(get_node("/root/Game/Board/Deck_Wagon_Location").get_transform())
	get_node("Deck_Road").set_transform(get_node("/root/Game/Board/Deck_Road_Location").get_transform())
	
	create_deck()
	deck_road = mix_deck(deck_road)
	deck_wagon = mix_deck(deck_wagon)
	#for card in deck_wagon:
	#	print(card)
	#for card in deck_road:
	#	print(card)
	
	for i in range(deck_wagon.size()):
		var card = Card_scene.instance()
		add_child(card)
		card.prepare_card(deck_wagon[i], i)
		deck_wagon[i] = card
	for i in range(deck_road.size()):
		var card = Card_scene.instance()
		add_child(card)
		card.prepare_card(deck_road[i], i)
		deck_road[i] = card

func mix_deck(deck):
	var size = deck.size()
	var cur_card = 0
	var mixed_deck = []
	
	for i in range(size):
		randomize()
		cur_card = randi() % deck.size()
		mixed_deck.append(deck[cur_card])
		deck.erase(deck[cur_card])
	
	return mixed_deck

func get_card_wagon():
	if (!deck_wagon.size()):
		take_from_discard_pile()
		print("STOP ", deck_wagon.size())
		return null
	else:
		var card = deck_wagon[deck_wagon.size() - 1]
		deck_wagon.erase(card)
		remove_child(card)
		if (deck_wagon.size()):
			var new_top_card = deck_wagon[deck_wagon.size() - 1]
			new_top_card.location = "deck_wagon_top"
			new_top_card.enable_connect()
		print("Left: ", deck_wagon.size())
		return card

func on_hover():
	var card = deck_wagon[deck_wagon.size() - 1]
	card._on_hover()

func off_hover():
	var card = deck_wagon[deck_wagon.size() - 1]
	card._off_hover()

func take_from_discard_pile():
	var discard_pile = get_node("/root/Game/Discard_pile").get_cards()
	var slots = get_node("/root/Game/Board").Slots
	if (!discard_pile.size()):
		for slot in slots:
			slot.claim = false
		print("passe")
	else:
		for slot in slots:
			slot.claim = true
		deck_wagon = discard_pile