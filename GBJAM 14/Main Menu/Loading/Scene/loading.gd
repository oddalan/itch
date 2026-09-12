extends Control

func _ready() -> void:
	await $AnimationPlayer.animation_finished
	
	$AudioStreamPlayer.play()
	
	await get_tree().create_timer(2.0).timeout
	
	
	get_tree().change_scene_to_packed(preload("res://Main Menu/Scene/Main Menu.tscn"))
