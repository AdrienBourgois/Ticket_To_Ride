extends "res://Script/net_constants.gd"

const port = 11500
var debug
var server
var connection = {}
var player = null

class client_data:
	var player = null
	var peer = PacketPeerStream.new()

func _ready():
	debug = get_node("Debug")
	server = TCP_Server.new()
	player = get_node("Spatial")
	if server.listen( port ) == 0:
		debug.add_text("Server Start on port: " + str(port))
		debug.newline()
		set_process(true)
	else:
		get_node("FailPort").show()
		get_node("FailPort").set_text("Fail to start on port" + str(port))

func _process(delta):
	if Input.is_key_pressed( KEY_ESCAPE ):
		_back_to_menu()
	if server.is_connection_available():
		var client = server.take_connection()
		connection[client] = client_data.new()
		connection[client].peer.set_stream_peer(client)
		debug.add_text("Client has connected!")
		debug.newline()
	
	for client in connection:
		if !client.is_connected():
			if connection[client].player:
				for cl in client:
					if cl == client:
						continue
					var pos = connection[client].player.get_transform.origin
					connection[cl].peer.put_var([PLAYER_DATA, [connection[client].player.name, int (pos.x), int(pos.y)] ] )
			connection.erase(client)
			continue
		
		if connection[client].peer.get_available_packet_count() > 0:
			for i in range( connection[client].peer.get_available_packet_count()):
				var data = connection[client].peer.get_var()
				if data[0] == PLAYER_DATA:
					if connection[client].player:
						continue
				
					var new_player = load("res://scene/player_test.scn").instance()
					print(new_player)
					connection[client].player = new_player
					print(connection[client].player)
					add_child(new_player)
					BroadcastConnect(client)
					SendConnect(client)
				elif data[0] == PLAYER_CONNECT:
					connection[client].player.set_transform(get_node("Spatial").get_global_transform())
	BroadcastData()

func BroadcastData():
	var data = [ PLAYER_DATA, [int(player.get_global_transform().origin.x), int(player.get_global_transform().origin.y)]]
	for client in connection:
		print(connection[client].player)
		var char = connection[client].player
		print(char)
		#data.append([int(char.get_global_transform().origin.x), int(char.get_global_transform().origin().y)])
	
	for client in connection:
		connection[client].peer.put_var(data)

func BroadcastConnect(client):
	var data = [PLAYER_CONNECT]
	for cl in connection:
		if cl == client:
			continue
		connection[cl].peer.put_var(data)

func SendConnect(client):
	var data = [PLAYER_CONNECT]
	for cl in connection():
		if cl == client:
			continue
		
	connection[client].peer.put_var(data)

func _on_FailPort_confirmed():
	get_node("../../Control").show()
	self.queue_free()
	pass # replace with function body

func _back_to_menu():
	if server:
		server.stop()
	get_node("../../Control").show()
	self.queue_free()
	pass
