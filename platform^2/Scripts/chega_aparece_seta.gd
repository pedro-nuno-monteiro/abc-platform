extends Area3D

@onready var arrow = $arrow

# Called when the node enters the scene tree for the first time.
func _ready():
	arrow.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "player":
		arrow.visible = true
