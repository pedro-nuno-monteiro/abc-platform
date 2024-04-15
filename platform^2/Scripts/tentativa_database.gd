extends Control

var database : SQLite
# Called when the node enters the scene tree for the first time.
func _ready():
	database = SQLite.new()
	database.path="res://data.db"
	database.open_db()
	
	var table = {
		"username" : {"data_type": "text", "primary_key":true, "not_null":true},
		"password" : {"data_type": "text", "not_null":true},
		"sexo" : {"data_type": "char", "not_null":true},
		"idade" : {"data_type": "int", "not_null":true},
	}
	database.create_table("register", table)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
