extends Node

const port = 3560
var debug
var server
var connection = []

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
	if server.is_connection_available():
		var client = server.take_connection()
		connection.append(client)
		var index = connection.find(client)
		debug.add_text("Client has connected!")
		debug.newline()
	for client in connection:
		if !client.is_connected():
			var index = connection.find(client)
			connection.remove(index)




func _on_FailPort_confirmed():
	get_node("../../Control").show()
	self.queue_free()
	pass # replace with function body
