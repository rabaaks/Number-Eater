extends StaticBody2D

@export var countdown_component_data: CountdownComponentData

@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var countdown_component: Node = $CountdownComponent
@onready var label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	countdown_component.data = countdown_component_data
	countdown_component.setup()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_enabled(enabled: bool):
	collision_shape.disabled = !enabled
	visible = enabled

func set_label(time: int):
	label.text = str(time)
