@tool
extends Node2D
@onready var transform_1: Sprite2D = %Transform1
@onready var transform_2: Sprite2D = %Transform2
@onready var transform_3: Sprite2D = %Transform3
@onready var transform_1_viz: HBoxContainer = %Transform1Viz
@onready var transform_2_viz: HBoxContainer = %Transform2Viz
@onready var transform_3_viz: HBoxContainer = %Transform3Viz

func _process(delta: float) -> void:
	transform_1_viz.update(Transform2DTxt.from_transform(transform_1.transform))
	transform_2_viz.update(Transform2DTxt.from_transform(transform_2.transform))
	transform_3.transform = transform_1.transform * transform_2.transform
	transform_3_viz.update(Transform2DTxt.from_transform(transform_3.transform))
