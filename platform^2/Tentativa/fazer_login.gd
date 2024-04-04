extends Node2D

var database = PostgreSQLClient.new()

var user = "postgres"
var password = "password"
var host = "localhost"
var port = 5432
var databaseConnection = "avc_platform"

# Called when the node enters the scene tree for the first time.
func _ready():
	database.connect("connection_established", self, "selectFromDB")
	database.connect("connection_error", self, "error")
	database.connect("connection_closed", self, "closedConnection")
	
	# database.connect_to_host("postgresql://" + user + ":" + password + "@" + host + ":" + port + "/" + databaseConnection)
	database.connect_to_host("postgresql://%s:%s@%s:%d/%s" % [user, password, host, port, databaseConnection])
	pass # Replace with function body.

func selectFromDB():
	print("running select query")
	
	var data = database.execute("""
	BEGIN;
	SELECT * FROM dados_user	
	"""	
	)
	
	for d in data:
		print(d.data_row)
	database.close()

func _process(delta):
	database.poll()
	pass

func closedConnection():
	print("database has been closed!")
	
func _exit_tree():
	database.close()
