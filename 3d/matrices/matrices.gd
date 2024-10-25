@tool
extends Node

@onready var _mr_g: Node3D = %"Mr G"
@onready var _00_transform: Transform3DVisualizer = %"00 Transform"
@onready var _01_position_formula: Transform3DVisualizer = %"01 Position Formula"
@onready var _01_position: Transform3DVisualizer = %"01 Position"
@onready var _02_rotation_formula: Transform3DVisualizer = %"02 Rotation Formula"
@onready var _02_rotation: Transform3DVisualizer = %"02 Rotation"
@onready var _03_scale_formula: Transform3DVisualizer = %"03 Scale Formula"
@onready var _03_scale: Transform3DVisualizer = %"03 Scale"
@onready var _04_skew:Transform3DVisualizer = %"04 Skew"

@export_range(0, 1, 0.01) var skew:float = 0

func _ready() -> void:
	_00_transform.update(Transform3DTxt.from_transform(Transform3D()))
	_01_position_formula.update(Transform3DTxt.from_values(["0", "0", "0"],["0", "0", "0"],["0", "0", "0"],["X", "Y", "Z"]))
	_02_rotation_formula.update(Transform3DTxt.from_values(
		["cos(a)+Rx²*(1−cos(a))", "Ry*Rx*(1−cos(a))+Rz*sin(a)", "Rz*Rx*(1−cos(a))−Ry*sin(a)"],
		["Rx*Ry*(1−cos(a))−Rz*sin(a)", "cos(a)+Ry²*(1−cos(a))", "Rz*Ry*(1−cos(a))+Rx*sin(a)"],
		["Rx*Rz*(1−cos(a))+Ry*sin(a)", "Ry*Rz*(1−cos(a))−Rx*sin(a)", "cos(a)+Rz²*(1−cos(a))"],
		["0", "0", "0"]
	))
	_03_scale_formula.update(Transform3DTxt.from_values(["X", "0", "0"], ["0", "Y", "0"], ["0", "0", "Z"], ["0", "0", "0"]))

func _process(delta: float) -> void:
	_01_position.update(Transform3DTxt.from_transform(Transform3D().translated(_mr_g.position)))
	_02_rotation.update(Transform3DTxt.from_transform(Transform3D(Basis(Quaternion.from_euler(_mr_g.rotation)), Vector3.ZERO)))
	_03_scale.update(Transform3DTxt.from_transform(Transform3D().scaled(_mr_g.scale)))
	_04_skew.update(Transform3DTxt.from_transform(Transform3D(_mr_g.transform.basis, Vector3.ZERO)))

	if _04_skew.visible:
		var z = Vector3(0,0,1)
		var y = Vector3(0,1,0)
		z = z.rotated(Vector3.UP, PI/2 * skew) * _mr_g.basis.z.length()
		y = y.rotated(Vector3.FORWARD, PI/2 * skew) * _mr_g.basis.y.length()
		_mr_g.basis.z = z
		_mr_g.basis.y = y

