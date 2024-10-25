extends Sprite2D

@export var speed:float = 500
@export var lifetime:float = 1.0

func _process(delta: float) -> void:
	position += transform.x * delta * speed
	lifetime -= delta
	if lifetime <= 0:
		queue_free()
