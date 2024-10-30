extends Node2D

@export var movement_speed:float = 150
@export var rotation_speed_degrees:float = 180
@export var bolt_scene:PackedScene

func _process(delta:float) -> void:
	if Input.is_action_just_pressed("fire"):
		var offset:Vector2 = Vector2(50, 0)
		var angles:Array[float] = [-45, 0, 45]
		
		for angle:float in angles:
			var bolt:Node2D = bolt_scene.instantiate()
			get_parent().add_child(bolt)
			
			## This is a small mistake in the video, the angle is expected in radians here
			## so we need to convert our angle to radians with deg_to_rad.
			bolt.transform = self.transform * Transform2D(deg_to_rad(angle), offset)
	
	
	var movement_direction:Vector2 = Input.get_vector("move_backward", "move_forward", "move_left", "move_right")
	var relative_direction:Vector2 = transform.x * movement_direction.x + transform.y * movement_direction.y
	
	var rotation_direction:float = Input.get_axis("turn_left", "turn_right")
	
	position += relative_direction * movement_speed * delta
	rotation_degrees += rotation_direction * rotation_speed_degrees * delta
