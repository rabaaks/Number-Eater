extends Node2D

const testlevel = preload("res://scenes/levels/test_level.tscn")
signal restart()

func _on_button_pressed() -> void:
	var lvl = testlevel.instantiate()
	get_parent().add_child(lvl)
	restart.connect(get_tree().current_scene.get_child(0)._on_restart)
	restart.emit()
	queue_free()
