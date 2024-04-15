extends Node2D

var database = PostgreSQLClient.new()

var user = "postgres"
var password = "postgres"
var host = "localhost"
var port = 5432
var databaseConnection = "avc_platform"


# Called when the node enters the scene tree for the first time.
func _ready():
	var _error = database.connect("connection_established", Callable(self, "_connection_established"))
	_error = database.connect("authentication_error", Callable(self, "_authentication_error"))
	_error = database.connect("connection_closed", Callable(self, "_connection_close"))
	_error = database.connect("data_received", Callable(self, "_data_received"))
	
	#Connection to the database
	_error = database.connect_to_host("postgresql://%s:%s@%s:%d/%s" % [user, password, host, port, databaseConnection])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
