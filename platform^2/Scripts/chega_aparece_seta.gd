extends Area3D

var arrow_rotation_speed = 1

@onready var arrow_2 = $arrow_2

var dentro = false

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.rotation_arrow = 0
	arrow_2.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dentro: 
		if Input.is_action_pressed("arrow_left"):
			rotateArrowLeft()
			#print(Globals.rotation_arrow)
		elif Input.is_action_pressed("arrow_rigth"):
			rotateArrowRight()
			#print(Globals.rotation_arrow)

# Função para rotacionar a seta em direção à esquerda
func rotateArrowLeft():
	arrow_2.rotation_degrees.y += arrow_rotation_speed
	Globals.rotation_arrow = arrow_2.rotation_degrees.y

# Função para rotacionar a seta em direção à direita
func rotateArrowRight():
	arrow_2.rotation_degrees.y -= arrow_rotation_speed
	Globals.rotation_arrow = arrow_2.rotation_degrees.y


func _on_body_entered(body):
	if body.name == "player":
		arrow_2.visible = true
		dentro = true

func _on_body_exited(body):
	if body.name == "player":
		arrow_2.visible = false
		dentro = false
