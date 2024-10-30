extends CharacterBody3D

@export var movement_speed:float = 5
@export var bolt_scene:PackedScene
@onready var pitch:Node3D = %Pitch
@onready var yaw:Node3D = self
@onready var right_hand:Node3D = %RightHand
@onready var left_hand:Node3D = %LeftHand


func _process(delta:float) -> void:
	if Input.is_action_just_pressed("fire"):
		var spawn_points:Array[Node3D] = [left_hand, right_hand]
		for spawn_point:Node3D in spawn_points:
			var bolt:Node3D = bolt_scene.instantiate()
			get_parent().add_child(bolt)
			
			bolt.global_transform = spawn_point.global_transform
	
	
	var movement_direction:Vector2 = Input.get_vector("move_backward", "move_forward", "move_left", "move_right")
	var movement_direction_3d:Vector3 = basis.x * movement_direction.y  - basis.z * movement_direction.x
	velocity = movement_direction_3d * movement_speed
	move_and_slide()
	
	
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
		
func _input(event:InputEvent) -> void:
	if not event is InputEventMouseMotion:
		return
		
	var mouse_movement:Vector2 = event.relative / 300 * PI
	yaw.rotate_y(-mouse_movement.x )
	pitch.rotate_x(-mouse_movement.y )
		
	pass
