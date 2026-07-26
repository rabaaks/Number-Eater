extends Node

signal time_changed(time: int)

@onready var timer: Timer = $Timer
@export var current_time: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for node in get_tree().get_nodes_in_group("countdown_components"):
		time_changed.connect(node._on_time_changed)
	
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	current_time -= 1
	time_changed.emit(current_time)
