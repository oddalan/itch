extends Control

@export var game_scene: PackedScene

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("Start"):
		get_tree().change_scene_to_packed(game_scene)
