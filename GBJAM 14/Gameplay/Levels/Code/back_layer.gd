extends Node2D

var start_pos = Vector2(0, 0)

func _ready() -> void:
	start_pos = global_position
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#global_position = (%Player.get_node("Camera2D").global_position / 5)
