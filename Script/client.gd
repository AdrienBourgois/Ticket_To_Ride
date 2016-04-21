
extends "res://Script/net_constants.gd"

const port = 3560
onready var ip = player_information.ip

var debug # kind of own debug console 
var entry

var connection # your connection (StreamPeerTCP) object
var peerstream # your data transfer (PacketPeerStream) object
var connected = false


func _ready():
	debug = get_parent().get_child(3).get_node("PanelChat/Chat")
	entry = get_parent().get_child(3).get_node("PanelChat/LineEdit")
	connection = StreamPeerTCP.new()
	connection.connect( ip, port )
	peerstream = PacketPeerStream.new()
	peerstream.set_stream_peer( connection )
	# since connection is created from StreamPeerTCP it also inherits its constants
	# get_status() returns following (int 0-3) values:
	if connection.get_status() == connection.STATUS_CONNECTED:
		debug.add_text( "Connected to "+ip+" :"+str(port) ); debug.newline()
		peerstream.put_var([PLAYER_CONNECT, player_information.player_name, player_information.player_color])
		get_parent().get_child(3).set_player_name()
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
			peerstream.put_var([PLAYER_CONNECT, player_information.player_name, player_information.player_color])
			connected = true
			return
	
	if connection.get_status() == connection.STATUS_NONE or connection.get_status() == connection.STATUS_ERROR:
		debug.add_text( "Server disconnected? " )
		set_process(false)
	
	if peerstream.get_available_packet_count() > 0:
		var data_received = peerstream.get_var()
		if data_received[0] == PLAYER_DATA:
			debug.add_text(data_received[1]); debug.newline()
		
	if Input.is_key_pressed(KEY_RETURN):
		var data = entry.get_text()
		if data != "":
			data = data.strip_edges()
			SendChatData(player_information.player_name, data)
			entry.set_text("")

func SendChatData(username, data):
	if data != "":
		peerstream.put_var([PLAYER_DATA, username + " : " + data])

func SendData(data):
	if data != "":
		peerstream.put_var(data)
	else:
		peerstream.put_var(player_information.player_name)
		peerstream.put_var(player_information.player_color)

func _on_Button_Back_pressed():
	if connection:
		connection.disconnect()
	get_tree().change_scene("res://Scene/General/main_menu.scn")
	queue_free() # remove yourself at idle frame