extends Control

@onready var coins_counter = $HBoxContainer/results_container/coins_container/coins_counter
@onready var timer_counter = $HBoxContainer/results_container/timer_container/timer_counter

# Called when the node enters the scene tree for the first time.
func _ready():
	coins_counter.text = str(Globals.coins)
	timer_counter.text = str("%02d" % Globals.minutes) + ":" + str("%02d" % Globals.seconds)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_play_again_btn_pressed():
	get_tree().change_scene_to_file("res://Cenas/nivel_1.tscn")


func _on_quit_btn_pressed():
	get_tree().change_scene_to_file("res://Cenas/depois_login.tscn")

