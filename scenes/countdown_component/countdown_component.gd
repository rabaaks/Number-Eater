extends Node

@export var target: Node

var data: CountdownComponentData

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func setup() -> void:
	pass

func _on_time_changed(time: int):
	print("signal received")
	print(time)
	if time == data.time:
		if data.countdown_type == data.CountdownType.DISAPPEARING:
			target.set_enabled(false)
	target.set_label(time - data.time)
