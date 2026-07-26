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
	if data.countdown_type == data.CountdownType.APPEARING:
		target.set_enabled(false)

func _on_time_changed(time: int):
	print("signal received")
	if data.countdown_type == data.CountdownType.STATIC:
		target.set_label(-1)
		return
	print(time)
	if data.countdown_type == data.CountdownType.ALTERNATING:
		if time % (data.time + 1) == 0:
			target.set_enabled(!target.get_enabled())
			target.set_label(data.time + 1)
		else:
			target.set_label(time % (data.time + 1))
		return
	if time == data.time:
		if data.countdown_type == data.CountdownType.DISAPPEARING:
			target.set_enabled(false)
		elif data.countdown_type == data.CountdownType.APPEARING:
			target.set_enabled(true)
	target.set_label(time - data.time)
