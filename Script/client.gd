
extends Node

const port = 3560
onready var ip = player_information.ip

var debug # kind of own debug console 

var connection # your connection (StreamPeerTCP) object
var peerstream # your data transfer (PacketPeerStream) object
var connected = false


func _ready():
	debug = get_node("Debug")
	connection = StreamPeerTCP.new()
	connection.connect( ip, port )
	peerstream = PacketPeerStream.new()
	peerstream.set_stream_peer( connection )
	# since connection is created from StreamPeerTCP it also inherits its constants
	# get_status() returns following (int 0-3) values:
	if connection.get_status() == connection.STATUS_CONNECTED:
		debug.add_text( "Connected to "+ip+" :"+str(port) ); debug.newline()
		set_process(true) # start processing if connected
		connected = true
	elif connection.get_status() == StreamPeerTCP.STATUS_CONNECTING:
		debug.add_text( "Trying to connect "+ip+" :"+str(port) ); debug.newline()
		set_process(true) # or if trying to connect
	elif connection.get_status() == connection.STATUS_NONE or connection.get_status() == StreamPeerTCP.STATUS_ERROR:
		debug.add_text( "Couldn't connect to "+ip+" :"+str(port) ); debug.newline()

func _process( delta ):
	if !connected:
		if connection.get_status() == connection.STATUS_CONNECTED:
			debug.add_text( "Connected to "+ip+" :"+str(port) ); debug.newline()
			connected = true
			return
	
	if connection.get_status() == connection.STATUS_NONE or connection.get_status() == connection.STATUS_ERROR:
		debug.add_text( "Server disconnected? " )
		set_process(false)
	
	if peerstream.get_available_packet_count() > 0:
		var data_received = peerstream.get_var()
		debug.add_text(data_received); debug.newline()
		print(data_received)
		
	if Input.is_key_pressed(KEY_RETURN):
		var data = get_node("LineEdit").get_text()
		if data != "":
			data = data.strip_edges()
			SendData(player_information.player_name, data)
			get_node("LineEdit").set_text("")

func SendData(username, data):
	if data != "":
		peerstream.put_var(username + " : " + data)

func _on_Button_Back_pressed():
	if connection:
		connection.disconnect()
	get_tree().change_scene("res://Scene/General/main_menu.scn")
	queue_free() # remove yourself at idle frame