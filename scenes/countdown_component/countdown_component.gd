extends Node

var data: CountdownComponentData

@onready var label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if data.countdown_type == data.CountdownType.STATIC:
		label.hide()
	else:
		label.text = str(data.time)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_time_changed(time: int):
	print("signal received")
	print(time)
