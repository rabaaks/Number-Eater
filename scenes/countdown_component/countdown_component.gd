extends Node

enum CountdownType {
	STATIC,
	DISAPPEARING,
	APPEARING,
	ALTERNATING
}

@export var countdown_type: CountdownType
@export var time: int
@export var editable: bool

@onready var label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if countdown_type == CountdownType.STATIC:
		label.hide()
	else:
		label.text = str(time)
	if countdown_type == CountdownType.APPEARING:
		get_parent().self_modulate.a = 0.3
	else:
		get_parent().self_modulate.a = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_time_changed(time: int):
	pass
