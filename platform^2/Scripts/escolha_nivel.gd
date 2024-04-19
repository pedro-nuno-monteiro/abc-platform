extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_exit_btn_pressed():
	get_tree().change_scene_to_file("res://Cenas/depois_login.tscn")
	

func _on_level_1_btn_pressed():
	Globals.nivel = 1
	get_tree().change_scene_to_file("res://Cenas/nivel_1.tscn")
	

func _on_level_2_btn_pressed():
	Globals.nivel = 2
	get_tree().change_scene_to_file("res://Cenas/nivel_2.tscn")

func _on_level_3_btn_pressed():
	Globals.nivel = 3
	get_tree().change_scene_to_file("res://Cenas/nivel_3.tscn")

func _on_level_4_btn_pressed():
	Globals.nivel = 4
	get_tree().change_scene_to_file("res://Cenas/nivel_4.tscn")

func _on_level_5_btn_pressed():
	pass # Replace with function body.


func _on_level_6_btn_pressed():
	pass # Replace with function body.


func _on_random_btn_pressed():
	pass # Replace with function body.
