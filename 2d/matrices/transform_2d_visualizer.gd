@tool
extends HBoxContainer

@onready var _00: Label = %"00"
@onready var _10: Label = %"10"
@onready var _20: Label = %"20"
@onready var _01: Label = %"01"
@onready var _11: Label = %"11"
@onready var _21: Label = %"21"




func update(transform:Transform2DTxt):
	_00.text = transform.x[0]
	_01.text = transform.x[1]
	_10.text = transform.y[0]
	_11.text = transform.y[1]
	_20.text = transform.o[0]
	_21.text = transform.o[1]
	 
