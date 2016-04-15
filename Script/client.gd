
extends "res://Script/net_constants.gd"

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
	player = get_node("Player")
	player.MakePlayer()
	if connection.get_status() == connection.STATUS_CONNECTED:
		print( "Connected to "+ip+" :"+str(port) )
		set_process(true) # start processing if connected
		connected = true
		peer.put_var( [ PLAYER_CONNECT, player.name ] ) # send our name to server
	elif connection.get_status() == StreamPeerTCP.STATUS_CONNECTING:
		print( "Trying to connect "+ip+" :"+str(port) )
		print( "Timeout in: ",timeout," seconds")
		get_node("Timeout").show()
		set_process(true) # or if trying to connect
	elif connection.get_status() == connection.STATUS_NONE or connection.get_status() == StreamPeerTCP.STATUS_ERROR:
		get_node("FailConnect").set_text("ERROR: BAD ADDRESS")
		get_node("FailConnect").show()

func _process( delta ):
	if Input.is_key_pressed( KEY_ESCAPE ): # press Esc to quit to menu
		GoToMenu()
		return
	if !connected: # not connected, but processing means we got STATUS_CONNECTING earlier
		if connection.get_status() == connection.STATUS_CONNECTED:
			print( "Connected to "+ip+" :"+str(port) )
			connected = true
			get_node("Timeout").hide()
			peer.put_var( [ PLAYER_CONNECT, player.name ] ) # send our name to server
			return # end this _process run
		if timeout > 0:
			timeout -= delta
			get_node("Timeout").set_text( "Timeout in: "+str(ceil(timeout)) ) # display timer
		else:
			get_node("FailConnect").set_text("ERROR: Server time Out!")
			get_node("FailConnect").show()
		
	
	if connection.get_status() == connection.STATUS_NONE or connection.get_status() == connection.STATUS_ERROR:
		get_node("FailConnect").set_text("ERROR: Server Disconnected")
		get_node("FailConnect").show()
		set_process(false)
	
	if peer.get_available_packet_count() > 0:
		for i in range( peer.get_available_packet_count() ):
			var data = peer.get_var()
			if data[0] == PLAYER_CONNECT: # here we receive other players names
				data.remove(0) # removing command from array
				for name in data: # looping through names
					if clones.has(name): # looks like he is already spawned
						print( name," already spawned?")
						continue
					var new_player = load("res://Player/player.scn").instance()
					new_player.name = name
					add_child(new_player)
					clones[ name ] = new_player # add to our dictionary { "name":Player.instance() }
			elif data[0] == PLAYER_DATA: # lets add handling data meantime
				# our data will be [ PLAYER_DATA, [name, pos.x, pos.y, anim(as string)], [name, pos.x, pos.y, anim(as string)] ... ]
				data.remove(0) # remove PLAYER_DATA
				for _data in data: # _data is 1 client array
					if _data[0] == player.name: # it's us
						continue # so skip
					
					if clones.has(_data[0]): # we got him spawned, don't we?
						clones[ _data[0] ].set_pos( Vector2(_data[1],_data[2]) )
						clones[ _data[0] ].anim = _data[3] # yeah, sending string is inefficient, you should try to fix it later by yourself
	
	if connected:
		var pos = player.get_pos()
		peer.put_var( [ PLAYER_DATA, int(pos.x), int(pos.y), player.anim ] ) # int uses less bandwidth than float and we wont notice difference
	
	




func GoToMenu():
	if connection:
		connection.disconnect()
	get_parent().show() # show menu
	queue_free() # remove yourself at idle frame

func _on_FailConnect_confirmed():
	get_parent().show()
	self.queue_free()
	pass # replace with function body
