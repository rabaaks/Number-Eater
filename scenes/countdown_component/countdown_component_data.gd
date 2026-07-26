class_name CountdownComponentData
extends Resource

enum CountdownType {
	STATIC,
	DISAPPEARING,
	APPEARING,
	ALTERNATING
}

@export var countdown_type: CountdownType
@export var time: int
@export var editable: bool
