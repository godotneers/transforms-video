@tool
extends Node2D

@onready var local_pos_label: Label = %LocalPosLabel
@onready var global_pos_label: Label = %GlobalPosLabel
@onready var v_box_container: VBoxContainer = %VBoxContainer
@onready var rotation_label: Label = %RotationLabel
@onready var scale_label: Label = %ScaleLabel
@onready var skew_label: Label = %SkewLabel


@export var full_mode:bool = false

func _process(delta: float) -> void:
	global_pos_label.visible = not full_mode
	rotation_label.visible = full_mode
	scale_label.visible = full_mode
	skew_label.visible = full_mode
	
	var parent = get_parent() 
	if not is_instance_valid(parent) or not (parent is Node2D):
		return
		 
	global_rotation = 0
	local_pos_label.text = "Position: " + str(parent.position)
	global_pos_label.text = "Global Position: " + str(parent.global_position)
	rotation_label.text = "Rotation: " + str(parent.rotation_degrees)
	scale_label.text = "Scale: " + str(parent.scale)
	skew_label.text = "Skew: " + str(parent.skew)
	
	v_box_container.position = Vector2(-v_box_container.size.x/2, 0)
	
