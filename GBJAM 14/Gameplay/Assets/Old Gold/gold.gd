extends Area2D

var save_file = "user://Save Data/Save.txt"

var has_finished = false

@export var next_scene: PackedScene

func enter(body: Node2D) -> void:
	if body.name == "Player" and not has_finished:
		$AnimatedSprite2D.play()
		await $AnimatedSprite2D.animation_finished
		
		await get_tree().create_timer(0.5).timeout
		
		SceneManager.change_scene_by_path(next_scene.resource_path)
