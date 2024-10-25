extends Camera2D

@export var movement_speed:float = 300

func _process(delta:float):
	var movement:Vector2 = Input.get_vector("camera_left", "camera_right", "camera_up", "camera_down")
	
	# account for rotated camera, similar to how we did player movement
	var corrected_movement = transform.x * movement.x + transform.y * movement.y
	
	position += delta * corrected_movement * movement_speed
		
func _input(event:InputEvent):
	if event.is_action("camera_zoom_in"):
		if Input.is_key_pressed(KEY_SHIFT):
			rotate(deg_to_rad(5))
		else:
			zoom += Vector2(0.1, 0.1)
		
			
	if event.is_action("camera_zoom_out"):
		if Input.is_key_pressed(KEY_SHIFT):
			rotate(deg_to_rad(-5))
		else:
			if zoom.length() > 0.2:
				zoom -= Vector2(0.1, 0.1)
