extends Control

var database : SQLite
@onready var username_existente = $username_existente
@onready var preenche_tudo = $preenche_tudo

var idade
var sexo
var registo_username
var registo_password

# Called when the node enters the scene tree for the first time.
func _ready():
	database = SQLite.new()
	database.path="res://data.db"
	database.open_db()
	username_existente.visible = false
	preenche_tudo.visible = false
	
	#var table = {
		#"username" : {"data_type": "text", "primary_key":true, "not_null":true},
		#"password" : {"data_type": "text", "not_null":true},
		#"sexo" : {"data_type": "char", "not_null":true},
		#"idade" : {"data_type": "int", "not_null":true},
	#}
	#database.create_table("register", table)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass




func _on_register_btn_pressed():
	var username_valido
	var campos_preenchidos
	
	#idade = int(idade)
	
	
	if idade == null or sexo == null or registo_password == null or registo_username == null:
		preenche_tudo.visible = true
		campos_preenchidos=false
		
	else: 
		preenche_tudo = false
		campos_preenchidos=true
		database.select_rows('register', "username = '" + registo_username + "'", ["*"])
		var query_result : Array = database.query_result
	
		if query_result.is_empty() and campos_preenchidos:
			username_valido = true
		else: 
			username_valido = false
			username_existente.visible = true
	
		
	if username_valido and campos_preenchidos: 
		var data = {
			"username" : registo_username,
			"password" : registo_password.sha256_text(),
			"sexo" : sexo,
			"idade" : int(idade)
		}
		database.insert_row("register", data)
		# .sha256_text() -> ver esta funcao para encriptar
		get_tree().change_scene_to_file("res://Cenas/title_screen.tscn")
		username_existente.visible = false


func _on_voltar_btn_pressed():
	get_tree().change_scene_to_file("res://Cenas/title_screen.tscn")


func _on_input_password_text_changed(new_text):
	registo_password=new_text
	

func _on_input_username_text_changed(new_text):
	registo_username = new_text


func _on_input_idade_text_changed(new_text):
	idade = new_text
	

func _on_input_sexo_text_changed(new_text):
	sexo = new_text
