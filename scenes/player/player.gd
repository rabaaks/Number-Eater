extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const SPAWN = Vector2(0, 0)
signal gameover()

func _ready():
	global_position = SPAWN

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	if global_position.y > 1167.0:
		gameover.connect(get_tree().current_scene.get_child(0)._on_gameover)
		gameover.emit()
		queue_free()
