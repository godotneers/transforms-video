@tool
extends Node3D

@onready var z_axis: Node3D = %ZAxis
@onready var y_axis: Node3D = %YAxis
@onready var x_axis: Node3D = %XAxis


@export_range(-360,360,0.1,"degrees") var x:float = 0
@export_range(-360,360,0.1,"degrees") var y:float = 0
@export_range(-360,360,0.1,"degrees") var z:float = 0


func _process(delta: float) -> void:
	z_axis.rotation_degrees = Vector3(0, 0, z)
	x_axis.rotation_degrees = Vector3(x+90, 0 ,0)
	y_axis.rotation_degrees = Vector3(0, 0, -90 + y)
	pass
