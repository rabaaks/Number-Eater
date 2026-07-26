extends Node

@export var target: Node

var data: CountdownComponentData

@onready var label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func setup() -> void:
	if data.countdown_type == data.CountdownType.STATIC:
		label.hide()
	else:
		label.text = str(data.time)
	if data.countdown_type == data.CountdownType.APPEARING:
		get_parent().self_modulate.a = 0.3
	else:
		get_parent().self_modulate.a = 1

func _on_time_changed(time: int):
	print("signal received")
	print(time)
	if time == data.time:
		if data.countdown_type == data.CountdownType.DISAPPEARING:
			target.set_enabled(false)
