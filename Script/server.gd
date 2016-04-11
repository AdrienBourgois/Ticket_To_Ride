extends "res://Script/net_constants.gd"

const port = 11500
var debug
var server
var connection = {}

class client_data:
	var player = null
	var peer = PacketPeerStream.new()

func _ready():
	debug = get_node("Debug")
	server = TCP_Server.new()
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
			connection.erase(client)




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
