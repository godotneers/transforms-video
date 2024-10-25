extends HBoxContainer

@onready var mouse_indicator: Node2D = %TargetIndicator
@onready var mouse_indicator_global_transform: HBoxContainer = %MouseIndicatorGlobalTransform
@onready var canvas_layer_transform: HBoxContainer = %CanvasLayerTransform
@onready var viewport_transform: HBoxContainer = %"Viewport Transform"

func _process(delta: float) -> void:
	var migt := Transform2DTxt.from_transform(mouse_indicator.global_transform)
	mouse_indicator_global_transform.update(migt)
	
	var layer = mouse_indicator.get_canvas_layer_node()
	var layer_transform = Transform2D() if layer == null else layer.transform
	var ct := Transform2DTxt.from_transform(layer_transform)
	canvas_layer_transform.update(ct)
	
	var vt = Transform2DTxt.from_transform(mouse_indicator.get_viewport().canvas_transform)
	viewport_transform.update(vt)
