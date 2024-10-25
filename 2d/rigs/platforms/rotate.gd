extends Sprite2D

@export var rotation_speed_degrees:float = 90

func _process(delta: float) -> void:
	rotation_degrees += rotation_speed_degrees * delta
