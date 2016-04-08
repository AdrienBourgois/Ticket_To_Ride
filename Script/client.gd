
extends Node

const port = 3560
var ip

var server
var debug # kind of own debug console 

var connection # your connection (StreamPeerTCP) object
var connected = false # for additional connection check
var timeout = 5


func _ready():
	debug = get_node("Debug")
	connection = StreamPeerTCP.new()
	connection.connect(ip, port)
	if connection.get_status() == connection.STATUS_CONNECTED:
		debug.add_text( "Connected to "+ip+" :"+str(port) )
		debug.newline()
		set_process(true)
		connected = true
	elif connection.get_status() == StreamPeerTCP.STATUS_CONNECTING:
		debug.add_text( "Trying to connect "+ip+" :"+str(port) )
		debug.newline()
		set_process(true)
	elif connection.get_status() == connection.STATUS_NONE or connection.get_status() == StreamPeerTCP.STATUS_ERROR:
		get_node("FailConnect").show()
		get_node("FailConnect").set_text( "Couldn't connect to "+ip+" :"+str(port) )
	pass

func _process(delta):
	if !connected:
		if connection.get_status() == connection.STATUS_CONNECTED:
			debug.add_text( "Connected to "+ip+" :"+str(port) )
			debug.newline()
			connected = true
			get_node("TimeOut").hide()
			return
		
		if timeout > 0:
			timeout -= delta
			get_node("TimeOut").set_text("Time out in :" + str(ceil(timeout)))
		else:
			get_node("FailConnect").show()
			get_node("FailConnect").set_text("Server Timed Out")
	
	if connection.get_status() == connection.STATUS_NONE or connection.get_status() == connection.STATUS_ERROR:
		get_node("FailConnect").show()
		get_node("FailConnect").set_text("Server Disconnected!")
		set_process(false)
	pass


func _on_FailConnect_confirmed():
	get_node("../../Control").show()
	self.queue_free()
