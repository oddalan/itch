@tool
extends Control
class_name City

@export var label: Label

@export var city_index: String = "1":
	set(value):
		city_index = value
		if is_inside_tree():
			label.text = value
			name = value
		
@export var scene: PackedScene

@export var next_level_up: City
@export var next_level_down: City
@export var next_level_left: City
@export var next_level_right: City
