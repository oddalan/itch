extends Control

func _ready() -> void:
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_packed(preload("res://Main Menu/Scene/Main Menu.tscn"))
