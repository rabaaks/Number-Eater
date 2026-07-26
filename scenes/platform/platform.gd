extends StaticBody2D

@export var countdown_component_data: CountdownComponentData

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CountdownComponent.data = countdown_component_data

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
