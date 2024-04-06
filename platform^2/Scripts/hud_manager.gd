extends Control

@onready var timer_counter = $container/timer_container/timer_counter as Label
@onready var coins_counter = $container/coins_container/coins_counter as Label
@onready var timer = $Timer as Timer


@export_range(0, 5) var default_minutes := 0 # de 0 a 5 minutos
@export_range(0, 59) var default_seconds := 0 # de 0 a 59 segundos

signal time_is_up()


# Called when the node enters the scene tree for the first time.
func _ready():
	coins_counter.text = str(Globals.coins)
	timer_counter.text = str("%02d" % default_minutes) + ":" + str("%02d" % default_seconds)
	reset_clock_timer()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	coins_counter.text = str(Globals.coins)

func _on_timer_timeout():
	if Globals.seconds == 59:
		if Globals.minutes > 0: 
			Globals.minutes += 1
			Globals.seconds = 0 
	Globals.seconds +=1 
	
	timer_counter.text = str("%02d" % Globals.minutes) + ":" + str("%02d" % Globals.seconds)
	
func reset_clock_timer():
	Globals.minutes=default_minutes
	Globals.seconds=default_seconds

