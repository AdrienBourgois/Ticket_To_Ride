
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
var number_player = 0

func _ready():
	debug = get_parent().get_child(3).get_node("PanelChat/Chat")
	entry = get_parent().get_child(3).get_node("PanelChat/LineEdit")
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
		number_player += 1
	
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
				if data_received[0] == PLAYER_CONNECT:
					player_information.player_name = data_received[1]
					player_information.player_color = data_received[2]
					get_parent().get_child(3).set_serverside_player_name()
				elif data_received[0] == PLAYER_DATA:
					debug.add_text(data_received[1]); debug.newline() # we don't use str() here since we're sure it'll be string
				SendData( data_received )
		
	if Input.is_key_pressed( KEY_RETURN ):
		var data = entry.get_text()
		if data != "":
			data = data.strip_edges()
			debug.add_text(username + " : " + data); debug.newline()
			SendDataWithName(username, data)
			entry.set_text("")

func SendDataWithName(name, data):
	if data != "":
		for peer in peerstream:
			peer.put_var([PLAYER_DATA, name + " : " + data])

func SendData( data ):
	if data != "":
		for peer in peerstream:
			peer.put_var(data)

func _on_Button_Back_pressed():
	if server:
		server.stop()
	get_tree().change_scene("res://Scene/General/main_menu.scn")
	queue_free() # remove yourself at idle frame

func get_player_number():
	return number_player