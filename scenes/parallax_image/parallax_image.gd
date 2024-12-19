extends Parallax2D

@onready var sprite_2d: Sprite2D = $Sprite2D

@export var texture: Texture2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Scale image to squash to size of screen	
	var scale_f: float = get_viewport_rect().size.y / texture.get_height()
	sprite_2d.texture = texture
	sprite_2d.scale = Vector2(scale_f, scale_f)
	# How far to scroll before mirroring the image	
	repeat_size.x = texture.get_width() * scale_f
	SignalManager.on_plane_died.connect(on_plane_died)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func on_plane_died() -> void:
	var p = position;
	autoscroll = Vector2.ZERO
	position = p
