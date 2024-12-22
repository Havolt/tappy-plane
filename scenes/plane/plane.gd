extends CharacterBody2D#

class_name Tappy

# Physics constants
const GRAVITY: float = 1000.0
const THRUST: float = -350.0

@onready var anim_sprite: AnimatedSprite2D = $AnimSprite
@onready var anima_player: AnimationPlayer = $AnimationPlayer
@onready var sound: AudioStreamPlayer2D = $Sound

func _ready() -> void:
	velocity = Vector2(0, THRUST)
	


func _physics_process(delta: float) -> void:
	# Apply gravity
	velocity.y += GRAVITY * delta
	
	# Check for input and fly
	fly()
	
	# Move the plane
	move_and_slide()
	
	# Kill the plane if it hits the floor
	if is_on_floor():
		die()
		
# Flying logic when user presses space
func fly() -> void:
	if Input.is_action_just_pressed("fly"):
		velocity.y = THRUST
		anima_player.play("power")

# Death logic
func die() -> void:
	anim_sprite.stop()
	sound.stop()
	set_physics_process(false)
	SignalManager.on_plane_died.emit()
