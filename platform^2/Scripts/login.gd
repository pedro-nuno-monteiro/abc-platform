extends Control
# Called when the node enters the scene tree for the first time.

var database : SQLite
@onready var password_username_wrong = $password_username_wrong

func _ready():
	database = SQLite.new()
	database.path="res://data.db"
	database.open_db()
	password_username_wrong.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass




func _on_entrar_btn_pressed():
	
	Globals.vazio = false
	
	if Globals.username == null or Globals.password == null:
		Globals.vazio = true
	
	if Globals.vazio == false:
		database.select_rows('register', "username = '" + Globals.username + "' and password = '" + Globals.password + "'" , ["*"])
		var query_result : Array = database.query_result
		
		if query_result.is_empty():
			password_username_wrong.visible = true
		else: 
			get_tree().change_scene_to_file("res://Cenas/depois_login.tscn")
			password_username_wrong.visible = false
	

func _on_voltar_btn_pressed():
	get_tree().change_scene_to_file("res://Cenas/title_screen.tscn")


func _on_input_password_text_changed(new_text):
	Globals.password = new_text


func _on_input_username_text_changed(new_text):
	Globals.username = new_text
