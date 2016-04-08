extends "res://net_constants.gd"

const port = 3560

var server # for holding your TCP_Server object
var connection = {}
var player = null

class client_data:
	var player = null
	var peer = PacketPeerStream.new()
	
# Why class? It's easier to add more variables / objects
# for each client
#	var ready = false
#	var spawned
#	var state = LOADING_MAP
#	...

func _ready():
	server = TCP_Server.new()
	player = get_node("Player")
	if server.listen(port) == 0:
		print("Server started at port "+str(port))
		set_process(true)
		player.MakePlayer()
	else:
		print( "Failed to start server on port "+str(port) )
		GoToMenu() # if failed go back to menu

func _process( delta ):
	if Input.is_key_pressed( KEY_ESCAPE ): # press Esc to quit to menu
		GoToMenu()
		return
	if server.is_connection_available(): # check if someone's trying to connect
		var client = server.take_connection() # accept connection
		connection[client] = client_data.new()
		connection[client].peer.set_stream_peer( client )
#		connection[client].player = load("res://Player/player.scn").instance()
		print( "Client has connected!" )
	
	for client in connection: # looping through all connected clients
		if !client.is_connected(): # maybe not connected anymore?
			print("Client disconnected "+str(client.get_status()))
			if connection[client].player: # if he have character spawned
				for cl in connection:
					if cl == client:
						continue
					var pos = connection[client].player.get_pos()
					connection[cl].peer.put_var( [ PLAYER_DATA, [connection[client].player.name, int(pos.x), int(pos.y), "Quit"] ] )
				connection[client].player.anim = "Quit"
			connection.erase(client) # remove him from dictionary
			continue # skip this run of loop / go to next element in loop
		
		if connection[client].peer.get_available_packet_count() > 0:
			for i in range( connection[client].peer.get_available_packet_count() ):
				var data = connection[client].peer.get_var()
				if data[0] == PLAYER_CONNECT: # data sent by client when connected
					if connection[client].player: # if client already have character
						continue # then ignore this data
					
					var new_player = load("res://Player/player.scn").instance() # create instance of player
					new_player.name = data[1] # name sent by client
					connection[client].player = new_player # assign this character to client
					add_child(new_player) # add character to scene
					BroadcastConnect(client) # tell all connected players that someone has joined
					SendConnect(client) # send connected players to new player
				elif data[0] == PLAYER_DATA: # received data from client
					# data = [ PLAYER_DATA, pos.x, pos.y, anim ]
					connection[client].player.set_pos( Vector2(data[1],data[2]) )
					connection[client].player.anim = data[3]
	
	BroadcastData()

func BroadcastData():
	var data = [ PLAYER_DATA, [player.name, int(player.get_pos().x), int(player.get_pos().y), player.anim] ] # add yourself
	for client in connection:
		var char = connection[client].player
		data.append( [ char.name, int(char.get_pos().x), int(char.get_pos().y), char.anim ] ) # add all connected clients
	
	for client in connection:
		connection[client].peer.put_var( data ) # send data

func BroadcastConnect( client ):
	var data = [ PLAYER_CONNECT, connection[client].player.name ]
	for cl in connection:
		if cl == client: # no need to send data to himself
			continue # next one please
		
		connection[cl].peer.put_var( data )

func SendConnect( client ):
	var data = [ PLAYER_CONNECT ]
	data.append( player.name ) # add self ( server )
	for cl in connection:
		if cl == client: 
			continue
		
		data.append( connection[cl].player.name ) # add other clients names
	connection[ client ].peer.put_var( data ) # send that data to connecting client

func GoToMenu():
	if server:
		server.stop()
	get_parent().show() # show menu
	queue_free() # remove yourself at idle frame