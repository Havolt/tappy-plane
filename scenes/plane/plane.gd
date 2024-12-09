extends CharacterBody2D

const GRAVITY: float = 600.0
const THRUST: float = -200.0

func _ready() -> void:
	pass
	


func _physics_process(delta: float) -> void:
	
	velocity.y += GRAVITY * delta
	
	fly()
	
	move_and_slide()

func fly() -> void:
	if Input.is_action_just_pressed("fly"):
		velocity.y = THRUST
