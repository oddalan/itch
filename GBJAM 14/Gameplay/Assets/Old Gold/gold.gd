extends Area2D

var save_file = "user://Save Data/Save.txt"

var has_finished = false

func enter(body: Node2D) -> void:
	if body.name == "Player" and not has_finished:
		$AnimatedSprite2D.play()
		await $AnimatedSprite2D.animation_finished
		
		await get_tree().create_timer(0.5).timeout
		
		
		get_tree().call_deferred("change_scene_to_file", "res://Main Menu/Level Select/level_select.tscn")
