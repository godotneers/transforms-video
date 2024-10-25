@tool
class_name Transform3DVisualizer
extends MeshInstance3D

@onready var title_label: Label = %TitleLabel
@onready var sub_viewport: SubViewport = %SubViewport
@onready var visualizer_control: HBoxContainer = %VisualizerControl

@onready var _00: Label = %"00"
@onready var _10: Label = %"10"
@onready var _20: Label = %"20"
@onready var _30: Label = %"30"
@onready var _01: Label = %"01"
@onready var _11: Label = %"11"
@onready var _21: Label = %"21"
@onready var _31: Label = %"31"
@onready var _02: Label = %"02"
@onready var _12: Label = %"12"
@onready var _22: Label = %"22"
@onready var _32: Label = %"32"

var _is_ready:bool = false

@export var title:String = "":
	set(value):
		title = value
		_refresh()

func update(values:Transform3DTxt):
	_00.text = values.x[0]
	_10.text = values.y[0]
	_20.text = values.z[0]
	_30.text = values.o[0]
	_01.text = values.x[1]
	_11.text = values.y[1]
	_21.text = values.z[1]
	_31.text = values.o[1]
	_02.text = values.x[2]
	_12.text = values.y[2]
	_22.text = values.z[2]
	_32.text = values.o[2]	
	
	sub_viewport.get_texture()


func _refresh():
	if not _is_ready:
		return
		
	title_label.text = title
	sub_viewport.get_texture()
		
func _ready():
	var mat:StandardMaterial3D = mesh.surface_get_material(0)
	var vptex:ViewportTexture = ViewportTexture.new()
	vptex.resource_local_to_scene = true
	vptex.viewport_path = sub_viewport.get_path()
	await RenderingServer.frame_post_draw
	mat.albedo_texture = vptex
	_is_ready = true
	_refresh()
		
func _process(delta: float) -> void:
	if not _is_ready:
		return
	sub_viewport.size = visualizer_control.size
	mesh.size = sub_viewport.size / 100.0
	
