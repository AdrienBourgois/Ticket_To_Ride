

extends "res://Script/net_constants.gd"

const port = 11500
var ip


var connection # your connection (StreamPeerTCP) object
var peer # your data transfer (PacketPeerStream) object
var connected = false
var player = null
var clones = {} # dictionary for finding clones more easily

var timeout = 5


func _ready():
	connection = StreamPeerTCP.new()
	connection.connect( ip, port )
	peer = PacketPeerStream.new()
	peer.set_stream_peer( connection )
	player = get_node("Spatial")
	if connection.get_status() == connection.STATUS_CONNECTED:
		set_process(true) # start processing if connected
		connected = true
		peer.put_var([PLAYER_CONNECT])
	elif connection.get_status() == StreamPeerTCP.STATUS_CONNECTING:
		get_node("TimeOut").show()
		set_process(true) # or if trying to connect
	elif connection.get_status() == connection.STATUS_NONE or connection.get_status() == StreamPeerTCP.STATUS_ERROR:
		get_node("FailConnect").set_text("ERROR: BAD ADDRESS!")
		get_node("FailConnect").show()

func _process( delta ):
	if Input.is_key_pressed( KEY_ESCAPE ): # press Esc to quit to menu
		_back_to_menu()
		return
	if !connected: # not connected, but processing means we got STATUS_CONNECTING earlier
		if connection.get_status() == connection.STATUS_CONNECTED:
			connected = true
			get_node("TimeOut").hide()
			return # end this _process run
		if timeout > 0:
			timeout -= delta
			get_node("TimeOut").set_text( "Timeout in: "+str(ceil(timeout)) ) # display timer
		else:
			get_node("FailConnect").set_text("ERROR: Server Time Out!")
			get_node("FailConnect").show()
	
	if connection.get_status() == connection.STATUS_NONE or connection.get_status() == connection.STATUS_ERROR:
		get_node("FailConnect").set_text("ERROR: Server Disconnected!")
		get_node("FailConnect").show()
		set_process(false)
	
	if peer.get_available_packet_count() > 0:
		for i in range(peer.get_available_packet_count()):
			var data = peer.get_var()
			if data[0] == PLAYER_CONNECT:
				data.remove(0)
				for name in data:
					var new_player = load("res://Scene/player_test.scn").instance()
					add_child(new_player)
			elif data[0] == PLAYER_DATA:
				data.remove(0)
				for _data in data:
					continue
			
					if clones.has(_data[0]):
						clones[_data[0]].set_translation(Vector3(data[1], data[2], 0))
	if connected:
		var pos = player.get_global_transform()
		peer.put_var([PLAYER_DATA, int(pos.origin.x), int(pos.origin.y)])
		print(peer.put_var([PLAYER_DATA, int(pos.origin.x), int(pos.origin.y)]))


func _back_to_menu():
	peer.put_var([PLAYER_DATA, int(1600)])
	print(peer.put_var([PLAYER_DATA, int(1600)]))
	if connection:
		connection.disconnect()
	get_node("../../Control").show() # show menu
	self.queue_free() # remove yourself at idle frame


func _on_FailConnect_confirmed():
	get_node("../../Control").show()
	self.queue_free()
	pass # replace with function body
