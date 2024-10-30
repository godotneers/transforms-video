extends Node2D

@export var angle_degrees:float = 5


func _process(delta:float) -> void:
	var card_count:int = get_child_count()
	for index:int in card_count:
		get_child(index).rotation_degrees = angle_degrees * index - (card_count-1) * angle_degrees / 2
