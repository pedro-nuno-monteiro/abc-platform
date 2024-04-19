extends VBoxContainer

var database : SQLite
var minutos
var segundos
var nivel
var coins
var posicao_y = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	database = SQLite.new()
	database.path="res://data.db"
	database.open_db()
	database.select_rows('scores', "register_username = '" + Globals.username + "'", ["*"])
	var query_result : Array = database.query_result
	
	if not query_result.is_empty():
		var vbox = VBoxContainer.new()
		add_child(vbox) 
		
		for registro in query_result:
			minutos = registro["minutos"]
			segundos = registro["segundos"]
			nivel = registro["nivel"]
			coins = registro["coins"]
			
			var novo_item = Label.new()
			#novo_item.text = "Tempo: " + str("%02d" % minutos) + ":"  + str("%02d" % segundos) + ", Segundos: " + str(segundos) + ", Nível: " + str(nivel) + ", Coins: " + str(coins)
			novo_item.text = "            " + str(nivel) + "                                                                             " + str("%02d" % minutos) + ":"  + str("%02d" % segundos)   + "                                                                          " + str(coins)

			vbox.add_child(novo_item)
			
		#vbox.rect_min_size = vbox.get_combined_minimum_size()

#func preencher_scroll_container():
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
