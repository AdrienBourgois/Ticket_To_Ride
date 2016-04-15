extends "res://Script/net_constants.gd"

var server # for holding your TCP_Server object
var connection = {}
#var player = null
var game = null

class client_data:
	#var player = null
	var game = null
	var peer = PacketPeerStream.new()
	
# Why class? It's easier to add more variables / objects
# for each client
#	var ready = false
#	var spawned
#	var state = LOADING_MAP
#	...

func _ready():
	server = TCP_Server.new()
#	player = get_node("Player")
	print("Wow...")
	game = get_node("Game")
	if server.listen(port) == 0:
		print("Server started at port "+str(port))
		set_process(true)
#		player.MakePlayer()
	else:
		get_node("FailPort").set_text("Fail start server on port" + str(port))
		get_node("FailPort").show()

func _process( delta ):
	if Input.is_key_pressed( KEY_ESCAPE ): # press Esc to quit to menu
		GoToMenu()
		return
	if server.is_connection_available(): # check if someone's trying to connect
		var client = server.take_connection() # accept connection
		connection[client] = client_data.new()
		connection[client].peer.set_stream_peer( client )
		print( "Client has connected!" )
	
	for client in connection: # looping through all connected clients
		if !client.is_connected(): # maybe not connected anymore?
#			connection[client].player.anim = "Quit"		
#			BroadcastData()
			connection.erase(client) # remove him from dictionary
			continue # skip this run of loop / go to next element in loop
		
		if connection[client].peer.get_available_packet_count() > 0:
			for i in range( connection[client].peer.get_available_packet_count() ):
				var data = connection[client].peer.get_var()
				if data[0] == PLAYER_CONNECT: # data sent by client when connected
#					if connection[client].player: # if client already have character
					continue # then ignore this data
					print("Hey")
#					var new_player = load("res://Player/player.scn").instance() # create instance of player
					var new_game = load("res://Scene/game.scn").instance()
#					new_player.name = data[1] # name sent by client
#					connection[client].player = new_player # assign this character to client
					connection[client].game = new_game
#					add_child(new_player) # add character to scene
					add_child(new_game)
					BroadcastConnect(client) # tell all connected players that someone has joined
					SendConnect(client) # send connected players to new player
#				elif data[0] == PLAYER_DATA: # received data from clien
#					connection[client].player.set_pos( Vector2(data[1],data[2]) )
#					connection[client].player.anim = data[3]
	
	BroadcastData()

func BroadcastData():
	var data = [ PLAYER_DATA]#, [player.name, int(player.get_pos().x), int(player.get_pos().y), player.anim] ] # add yourself
	for client in connection:
		var char = connection[client].game
		#data.append( [ char.name, int(char.get_pos().x), int(char.get_pos().y), char.anim ] ) # add all connected clients
	
	for client in connection:
		connection[client].peer.put_var( data ) # send data

func BroadcastConnect( client ):
	var data = [ PLAYER_CONNECT]#, connection[client].player.name ]
	for cl in connection:
		if cl == client: # no need to send data to himself
			continue # next one please
		
		connection[cl].peer.put_var( data )

func SendConnect( client ):
	var data = [ PLAYER_CONNECT ]
	#data.append( player.name ) # add self ( server )
	for cl in connection:
		if cl == client: 
			continue
		
	#	data.append( connection[cl].player.name ) # add other clients names
	connection[ client ].peer.put_var( data ) # send that data to connecting client

func GoToMenu():
	if server:
		server.stop()
	get_parent().show() # show menu
	self.queue_free() # remove yourself at idle frame

func _on_FailPort_confirmed():
	get_parent().show()
	self.queue_free()
	pass # replace with function body
