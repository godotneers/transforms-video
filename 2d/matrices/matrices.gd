@tool
extends Node2D

@onready var icon: Sprite2D = %MrG
@onready var position_matrix: HBoxContainer = %"Position Matrix"
@onready var rotation_matrix: HBoxContainer = %"Rotation Matrix"
@onready var scale_matrix: HBoxContainer = %"Scale Matrix"
@onready var skew_matrix: HBoxContainer = %"Skew Matrix"
@onready var position_formula_matrix: HBoxContainer = %"Position Formula Matrix"
@onready var rotation_formula_matrix: HBoxContainer = %"Rotation Formula Matrix"
@onready var rotation_live_formula_matrix: HBoxContainer = %"Rotation Live Formula Matrix"
@onready var scale_formula_matrix: HBoxContainer = %"Scale Formula Matrix"
@onready var skew_formula_matrix: HBoxContainer = %"Skew Formula Matrix"
@onready var transform_formula_matrix: HBoxContainer = %"Transform Formula Matrix"


func _ready():
	transform_formula_matrix.update(Transform2DTxt.from_values(["1", "0"], ["0", "1"], ["0", "0"]))
	position_formula_matrix.update(Transform2DTxt.from_values(["1", "0"], ["0", "1"], ["X", "Y"]))
	rotation_formula_matrix.update(Transform2DTxt.from_values(["cos(a)", "sin(a)"], ["-sin(a)", "cos(a)"], ["0", "0"]))
	scale_formula_matrix.update(Transform2DTxt.from_values(["X", "0"], ["0", "Y"], ["0", "0"]))
	skew_formula_matrix.update(Transform2DTxt.from_values(["1", "0"], ["Y0", "Y1"], ["0", "0"]))

func _process(delta: float) -> void:
	position_matrix.update(Transform2DTxt.from_transform(Transform2D(0, icon.position)))
	rotation_matrix.update(Transform2DTxt.from_transform(Transform2D(icon.rotation, Vector2.ZERO)))
	rotation_live_formula_matrix.update(Transform2DTxt.from_values(
		["cos(%0.1f)" % icon.rotation_degrees, "sin(%0.1f)" % icon.rotation_degrees],
		["-sin(%0.1f)" % icon.rotation_degrees, "cos(%0.1f)" % icon.rotation_degrees],
		["0", "0"]
		)
	)
	scale_matrix.update(Transform2DTxt.from_transform(Transform2D(0, icon.scale, 0, Vector2.ZERO)))
	skew_matrix.update(Transform2DTxt.from_transform(Transform2D(0,Vector2.ONE,icon.skew,Vector2.ZERO)))
	
	
	
