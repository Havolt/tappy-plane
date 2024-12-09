extends CharacterBody2D

const GRAVITY: float = 600.0


func _ready() -> void:
	pass
	


func _physics_process(delta: float) -> void:
	
	velocity.y += GRAVITY * delta
	
	print(velocity)
	
	move_and_slide()
