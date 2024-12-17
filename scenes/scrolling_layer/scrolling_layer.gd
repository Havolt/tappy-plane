extends ParallaxLayer

const IMG_W: float = 1920.0
const IMG_H: float = 1080.0

@onready var sprite_2d: Sprite2D = $Sprite2D

@export var texture: Texture2D
@export var scroll_scale: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Setup scrolling speed	
	motion_scale.x = scroll_scale
	# Scale image to squash to size of screen	
	var scale_f: float = get_viewport_rect().size.y / IMG_H
	sprite_2d.texture = texture
	sprite_2d.scale = Vector2(scale_f, scale_f)
	# How far to scroll before mirroring the image	
	motion_mirroring.x = IMG_W * scale_f
