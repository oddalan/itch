extends Control

func _process(delta: float) -> void:
	$Player.position.x = remap($"../../..".global_position.x, -500, 500, 0, 40)
	$Player.position.y = remap($"../../..".global_position.y, -500, 500, 0, 40)
