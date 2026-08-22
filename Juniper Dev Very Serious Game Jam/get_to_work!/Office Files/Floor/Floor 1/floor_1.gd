@tool
extends Node2D

func position_change():
	name = "Floor 1: x_" + str(position.x) + ", y_" + str(position.y) + ", num_1"

func _enter_tree() -> void:
	# Enable transform notifications so the engine tracks movements
	set_notify_transform(true)

func _notification(what: int) -> void:
	if what == NOTIFICATION_TRANSFORM_CHANGED:
		position_change()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
