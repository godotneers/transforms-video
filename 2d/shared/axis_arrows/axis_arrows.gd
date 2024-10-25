@tool
extends Node2D

@onready var arrow_x: Sprite2D = %ArrowX
@onready var arrow_y: Sprite2D = %ArrowY

func _process(delta: float) -> void:
	arrow_x.global_scale.y = 1
	arrow_y.global_scale.y = 1
