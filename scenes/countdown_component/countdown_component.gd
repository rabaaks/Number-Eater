extends Node

var data: CountdownComponentData

@onready var label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if data.countdown_type == data.CountdownType.STATIC:
		label.hide()
	else:
<<<<<<< HEAD
		label.text = str(data.time)
=======
		label.text = str(time)
	if countdown_type == CountdownType.APPEARING:
		get_parent().self_modulate.a = 0.3
	else:
		get_parent().self_modulate.a = 1
>>>>>>> 3be276eb50feca806442d4544eda59f6de849c35

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_time_changed(time: int):
	print("signal received")
	print(time)
