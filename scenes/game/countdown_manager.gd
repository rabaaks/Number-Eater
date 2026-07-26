extends Node

signal time_changed(time: int)

@onready var timer: Timer = $Timer
@onready var label: Label = $Label
@onready var lvlmanager = $"../LevelManager"

@export var current_time: int
const gameover = preload("res://scenes/levels/game_over.tscn")
const player = preload("res://scenes/player/player.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for node in get_tree().get_nodes_in_group("countdown_components"):
		time_changed.connect(node._on_time_changed)
	
	timer.start()
	label.show()
	label.text = str(current_time)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	current_time -= 1
	time_changed.emit(current_time)
	label.text = str(current_time)
	if current_time < 0:
		_on_gameover()

func _on_restart():
	timer.start()
	label.show()
	label.text = str(current_time)
	var plyr = player.instantiate()
	get_tree().current_scene.add_child(plyr)

func _on_gameover():
	lvlmanager.get_child(0).queue_free()
	get_tree().current_scene.get_child(2).queue_free()
	label.hide()
	timer.stop()
	current_time = 10
	var lvl = gameover.instantiate()
	lvlmanager.add_child(lvl)
