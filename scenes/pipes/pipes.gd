extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= 150.0 * delta
	check_off_screen()
	
func check_off_screen():
	if position.x < -500.0:
		queue_free()


func _on_screen_exited() -> void:
	queue_free()
