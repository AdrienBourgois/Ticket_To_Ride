
extends "res://Script/net_constants.gd"

const port = 3560
var debug # kind of own debug console 
var entry

onready var username = player_information.player_name
var server # for holding your TCP_Server object
var connection = [] # for holding multiple connection (StreamPeerTCP) objects
var peerstream = [] # for holding multiple data transfer (PacketPeerStream) objects
var player_name_dictionnary = {}
var player_name = []

func _ready():
	debug = get_parent().get_child(4).get_node("PanelChat/Chat")
	entry = get_parent().get_child(4).get_node("PanelChat/LineEdit")
	server = TCP_Server.new()
	if server.listen(port) == 0:
		debug.add_text("Server started at port "+str(port)); debug.newline()
		set_process(true)
	else:
		debug.add_text( "Failed to start server on port "+str(port) ); debug.newline()

func _process( delta ):
	if server.is_connection_available(): # check if someone's trying to connect
		var client = server.take_connection() # accept connection
		connection.append( client ) # we need to save him somewhere, that's why we have our Array
		peerstream.append( PacketPeerStream.new() ) # also add some data transfer object
		var index = connection.find( client )
		peerstream[ index ].set_stream_peer( client )
		debug.add_text( "Client has connected!" ); debug.newline()
		for peer in peerstream:
			print("name: ", peer.get_var())
			player_name_dictionnary["name"] = peer.get_var()
			print(player_name_dictionnary)
			player_name.append(player_name_dictionnary)
			print(player_name[0]["name"])
	
	for client in connection:
		if !client.is_connected():
			debug.add_text("Client disconnected "+str(client.get_status())); debug.newline()
			var index = connection.find( client )
			connection.remove( index )
			peerstream.remove( index )
	
	for peer in peerstream:
		if peer.get_available_packet_count() > 0:
			for i in range( peer.get_available_packet_count() ):
				var data_received = peer.get_var()
				debug.add_text(data_received); debug.newline() # we don't use str() here since we're sure it'll be string
				SendData( data_received )
		
	if Input.is_key_pressed( KEY_RETURN ):
		var data = entry.get_text()
		if data != "":
			data = data.strip_edges()
			debug.add_text(username + " : " + data); debug.newline()
			print("Hello")
			SendDataWithName(username, data)
			entry.set_text("")

func SendDataWithName(name, data):
	if data != "":
		for peer in peerstream:
			peer.put_var(name + " : " + data)

func SendData( data ):
	if data != "":
		for peer in peerstream:
			peer.put_var(data)

func _on_Button_Back_pressed():
	if server:
		server.stop()
	get_tree().change_scene("res://Scene/General/main_menu.scn")
	queue_free() # remove yourself at idle frame