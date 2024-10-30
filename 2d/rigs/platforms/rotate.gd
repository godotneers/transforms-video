extends Node2D

@export var rotation_speed_degrees:float = 20

func _process(delta:float) -> void:
	rotation_degrees += rotation_speed_degrees * delta
	

