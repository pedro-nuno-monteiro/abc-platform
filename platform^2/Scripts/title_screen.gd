extends Control
# estava extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Por enqunto o register e o login fazem o mesmo

func _on_register_btn_pressed():
	get_tree().change_scene_to_file("res://Cenas/register.tscn")

func _on_login_btn_pressed():
	get_tree().change_scene_to_file("res://Cenas/login.tscn")

func _on_exit_btn_pressed():
	get_tree().quit()
