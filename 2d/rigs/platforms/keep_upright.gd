extends Sprite2D


func _process(delta: float) -> void:
	rotation = -(get_parent().global_transform.get_rotation())
