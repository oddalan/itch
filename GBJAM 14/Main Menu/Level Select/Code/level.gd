@tool
extends Control
class_name City

@export var world_index: int = 1

@export var next_level_up = City

func _ready() -> void:
	$Label.text = "City " + str(world_index)
	
func _process(delta: float) -> void:
	if Engine.is_editor_hint():
		$Label.text = "City " + str(world_index)
