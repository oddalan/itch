extends Node

var current_beat: int = 1

@export var beats_per_switch: int = 8
@export var time_per_switch: float = 4.0

func _ready() -> void:
	$Timer.wait_time = 4.0 / beats_per_switch

	await get_tree().create_timer(4.0 / beats_per_switch).timeout
	
	$"Lower Note".play()
	


func beat() -> void:
	current_beat += 1
	if current_beat < beats_per_switch:
		$"Lower Note".play()
	else:
		$"Upper Note".play()
		current_beat = 0
