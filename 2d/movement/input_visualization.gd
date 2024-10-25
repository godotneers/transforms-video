extends MarginContainer

@export var show_turn_controls:bool = true

@onready var forward_container: PanelContainer = %ForwardContainer
@onready var left_container: PanelContainer = %LeftContainer
@onready var backward_container: PanelContainer = %BackwardContainer
@onready var right_container: PanelContainer = %RightContainer
@onready var turn_left_container: PanelContainer = %TurnLeftContainer
@onready var turn_right_container: PanelContainer = %TurnRightContainer
@onready var turn_left_container_empty:Control = %TurnLeftContainerEmpty
@onready var turn_right_container_empty:Control = %TurnRightContainerEmpty


func _ready():
	visible = true
	
	turn_left_container.visible = show_turn_controls
	turn_left_container_empty.visible = not show_turn_controls
	turn_right_container.visible = show_turn_controls
	turn_right_container_empty.visible = not show_turn_controls
	

func _process(delta: float) -> void:
	turn_left_container.theme_type_variation = "lit" if Input.is_action_pressed("turn_left") else ""
	turn_right_container.theme_type_variation = "lit" if Input.is_action_pressed("turn_right") else ""
	forward_container.theme_type_variation = "lit" if Input.is_action_pressed("move_forward") else ""
	backward_container.theme_type_variation = "lit" if Input.is_action_pressed("move_backward") else ""
	left_container.theme_type_variation = "lit" if Input.is_action_pressed("move_left") else ""
	right_container.theme_type_variation = "lit" if Input.is_action_pressed("move_right") else ""
	
