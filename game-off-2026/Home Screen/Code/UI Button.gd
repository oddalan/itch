extends Button

func _ready() -> void:
	$AnimationPlayer.play("Unhover")

func focus_exited() -> void:
	$AnimationPlayer.play("Unhover")

func mouse_exited() -> void:
	$AnimationPlayer.play("Unhover")
