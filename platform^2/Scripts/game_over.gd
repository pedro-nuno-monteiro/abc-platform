extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_restart_btn_pressed():
	if Globals.nivel == 1:
		get_tree().change_scene_to_file("res://Cenas/nivel_1.tscn")
	if Globals.nivel == 2: 
		get_tree().change_scene_to_file("res://Cenas/nivel_2.tscn")
	if Globals.nivel == 3:
		get_tree().change_scene_to_file("res://Cenas/nivel_3.tscn")
	if Globals.nivel == 4:
		get_tree().change_scene_to_file("res://Cenas/nivel_4.tscn")

func _on_back_to_menu_btn_pressed():
	get_tree().change_scene_to_file("res://Cenas/depois_login.tscn")
